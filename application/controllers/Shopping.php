<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Shopping extends CI_Controller
{
    public function __construct()
    {
        parent:: __construct();

        $this->load->library('cart');

        $this->load->model('Produits_model');
    }

    public function validerCommande()
    {
        if ($this->cart->total_items() <= 0) {
            redirect('produits');
        } else {

            $clientData = $data = array();
            $validate = $this->input->post('btn_commande');
            $account = $this->input->post('client_account');

            if (isset($validate)) {
                $this->form_validation->set_rules('client_name', 'client_name', 'required');
                $this->form_validation->set_rules('client_prename', 'client_prename', 'required');
                $this->form_validation->set_rules('client_email', 'client_email', 'required|valid_email');
                $this->form_validation->set_rules('client_phone', 'client_phone', 'required');
                /*
                            if(isset($account)) {
                                $this->form_validation->set_rules('client_password', 'client_password', 'required');
                                $this->form_validation->set_rules('password_confirmation', 'password_confirmation', 'match[client_password]');
                            }*/
                #client data
                $clientData = array(
                    'client_name' => strip_tags($this->input->post('client_name') . ' - ' . $this->input->post('client_prename')),
                    'client_email' => strip_tags($this->input->post('client_email')),
                    'client_phone' => strip_tags($this->input->post('client_phone')),
                    'client_address' => strip_tags($this->input->post('client_address')),
                    'client_city' => strip_tags($this->input->post('client_city')),
                );

                $email_client = $this->input->post('client_email');
                $email_phone = $this->input->post('client_phone');

                if ($this->form_validation->run() == true) {

                    $identifiant_client ='';

                    $client_existant = $this->Produits_model->get_result('tb_zad_clients', 'client_email', $email_client);

                    if ($client_existant['client_phone'] === $email_phone OR $client_existant['client_email'] === $email_client){

                        $client_existant_mail = $this->Produits_model->get_unique('tb_zad_clients', array('client_email' => $email_client))->client_id;

                        $client_existant_phone = $this->Produits_model->get_unique('tb_zad_clients', array('client_email' => $email_client))->client_id;

                        #get client ID
                        $clientID = (!empty($client_existant_phone) ? $client_existant_phone : $client_existant_mail);

                        $identifiant_client = $clientID;
                    }
                    else{

                        #save client data
                        $insert_client = $this->Produits_model->insert_data('tb_zad_clients', $clientData);

                      if ($insert_client){
                          #get client ID
                          $clientID = $this->Produits_model->get_unique('tb_zad_clients', array('client_email' => $email_client))->client_id;
                          $identifiant_client = $clientID;
                      }
                    }

                    if ($identifiant_client) {

                        //$commande = $this->enregistrerCommandeClient($clientID);
                       // $this->display($commande);

                        #commande data
                        $dataCommande = array(
                            'client_sid' => $identifiant_client,
                            'order_total' => $this->cart->total(),
                            'order_status' => 1,
                            'order_observation' =>$this->input->post('observation')
                        );

                        #commande data create
                        $insert_commande = $this->Produits_model->insert_data('tb_zad_commandes', $dataCommande);

                        if ($insert_commande) {
                            #get client ID
                            $orderID = $this->Produits_model->get_unique('tb_zad_commandes', array('client_sid' => $clientID))->order_id;

                            //Creation facture

                            $montant_tva = ($this->cart->total() * 16)/100;
                            $netApayer = ($montant_tva + $this->cart->total());

                            $_SESSION['montant'] = $netApayer;

                            #commande data
                            $dataFacture = array(
                                'facture_numero' =>$this->numeroFacture(),
                                'facture_montant' => $this->cart->total(),
                                'facture_tva' => $montant_tva,
                                'mode_paiement' =>"Cash",
                                'client_sid' => $identifiant_client,
                                'order_sid' => $orderID,
                                'facture_ttc' =>$netApayer,
                                'facture_status' => 1
                            );
                            #insert facture create
                           $this->Produits_model->insert_data('tb_zad_factures', $dataFacture);

                            #all products  in cart shopped
                            $achats = $this->cart->contents();
                            $ligneCommandes = array();

                            $i = 0;
                            //achat_id	order_sid
                            foreach ($achats as $ligne) {
                                $ligneCommandes[$i]['order_sid'] = $orderID;
                                $ligneCommandes[$i]['product_sid'] = $ligne['id'];
                                $ligneCommandes[$i]['achat_quantity'] = $ligne['qty'];
                                $ligneCommandes[$i]['achat_subtotal'] = $ligne['subtotal'];
                                $i++;
                            }

                            if (!empty($ligneCommandes)) {

                                $insert_LigeAchats = $this->Produits_model->insert_multiple('tb_zad_achats', $ligneCommandes);

                                if ($insert_LigeAchats) {
                                    $this->cart->destroy();

                                   // $this->display($insert_LigeAchats);

                                     redirect('shopping/orderSuccess');
                                }
                                else {
                                    $data['error_notifie'] = 'Echec de validation de la commande.';
                                }
                            }
                        }else {
                            $data['error_notifie'] = 'Echec de validation de la commande.';
                        }
                    } else {
                        $data['error_notifie'] = 'Erreur de validation de la commande. Veuillez reessayer';
                    }
                }
            }
            $data['clientData'] = $clientData;
            $data['cartItems'] = $this->cart->contents();
            $data['achats'] = $this->cart->contents();
            $this->load->view('includes/header', $data);
            $this->load->view('commandes/achats/' . $data);
            $this->load->view('includes/footer', $data);
        }
    }
    //generation auto du code de reference
    public function numeroFacture()
    {
        $al = "0123456789";
        $code_validation = substr(str_shuffle(str_repeat($al, rand(5, 20))), 0, 5);
        return $code_validation;
    }
    function orderSuccess()
    {
        $data['success'] = "Votre commande a ete prise en compte avec success";

        $data['title'] = ucfirst("Shopping"); //Ceci recupere le nom de la page et l'affiche dans title en majusle sur la première lettre
        $data['page'] = "shopping";

        $data['montantTotal'] = $_SESSION['montant'];

        $this->load->view('includes/header', $data);
        $this->load->view('commandes/orderSuccess', $data);
        $this->load->view('includes/footer', $data);
    }

    #ajouter un article au panier
    public function addToCart($idproduct)
    {
        $produits = $this->Produits_model->get_result('tb_zad_products', 'product_id', $idproduct);

        $data =
            array(
                'id' => $produits['product_id'],
                'qty' => 1,
                'price' => $produits['product_price'],
                'name' => $produits['product_title'],
                'image' => $produits['product_image']
            );
        // $this->display($data);

        $this->cart->insert($data);
        redirect('shopping/monPanier');
    }


    #enlever un article au panier
    public function deleteToCart($rowid)
    {

        $remove = $this->cart->remove($rowid);

        redirect('shopping/monPanier');
    }

    public function monPanier()
    {
        //cartitems
        $data['achats'] = $this->cart->contents();
        $this->cart->insert($data);
        $data['title'] = ucfirst("Shopping"); //Ceci recupere le nom de la page et l'affiche dans title en majusle sur la première lettre
        // $data['title'] = $page;
        $data['page'] = "shopping";
        $this->load->view('includes/header', $data);
        $this->load->view('commandes/achats', $data);
        $this->load->view('includes/footer', $data);
    }

    public function updateQuantity($rowid)
    {
        $update = 0;

        if (!empty($rowid)) {
            $data = array(
                'rowid' => $rowid,
                'qty' => 1
            );
            $this->cart->update($data);
            redirect('shopping/monPanier');
        }
    }
}
