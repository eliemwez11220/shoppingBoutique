<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class Produits extends CI_Controller
{
    public function __construct()
    {
        parent:: __construct();
        $this->load->library('cart');

        $this->load->model('Produits_model');
    }

    #ajouter un article au panier
    public function details($idproduct){

        $data['produits'] = $this->Produits_model->get_result('tb_zad_products', 'product_id', $idproduct);

        $produits = $this->Produits_model->get_result('tb_zad_products', 'product_id', $idproduct);

        $dataArticle =
            array(
                'id'      => $produits['product_id'],
                'qty'     => 1,
                'price'   => $produits['product_price'],
                'name'    => $produits['product_title'],
                'categorie'    => $produits['mark_sid'],
                'image'    => $produits['product_image']
            );

        $data['produitsSimilaires'] = $this->Produits_model->get_response('tb_zad_products',
            array('mark_sid' => $produits['mark_sid']), 'tb_zad_products.product_created', 'DESC', '6');

        //$this->display( $data['produitsSimilaires']);

        $data['title']=ucfirst("details produits"); //Ceci recupere le nom de la page et l'affiche dans title en majusle sur la première lettre
        $data['page'] = "details produits";
        $this->load->view('includes/header', $data);
        $this->load->view('pages/detailsProduit', $data);
        $this->load->view('includes/footer', $data);
    }
    #enlever un article au panier
    public function deleteToCart($rowid){

        $remove  =$this->cart->remove($rowid);

        redirect('shopping/monPanier');
    }

    public function monPanier(){
        //cartitems
        $data['achats']=$this->cart->contents();
        $this->cart->insert($data);
        $data['title']=ucfirst("Shopping"); //Ceci recupere le nom de la page et l'affiche dans title en majusle sur la première lettre
        // $data['title'] = $page;
        $data['page'] = "shopping";
        $this->load->view('includes/header', $data);
        $this->load->view('commandes/achats', $data);
        $this->load->view('includes/footer', $data);
    }

    public function updateQuantity(){
        $update=0;

        $rowid=$this->input->get('rowid');
        $qty=$this->input->get('qty');

        if(!empty($rowid) && !empty($qty)){
            $data =
                array(
                    'roqid'      => $rowid,
                    'qty'     => $qty
                );
            $update = $this->cart->update($data);
            redirect('shopping/monPanier');
        }
        echo $update?'ok':'err';
    }
}
