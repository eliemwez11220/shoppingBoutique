<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class Users extends CI_Controller
{
    public function __construct()
    {
        parent:: __construct();
        // verifie of login
        $this->is_logged();
        // charge all models
        $this->load->model('Secure_model');
        $this->load->model('App_model');
        //derniere connexion prise en compte
        $this->last_connexion();

        #GroceryCRUD Librairie loading
        $this->load->library('grocery_CRUD');
    }
    /**
     *@ Check is admin is logged
     */
    private function is_logged()
    {
        if (!$this->session->logged) {
            // code...
            return redirect(base_url());
        }
    }
    //mettre a jour la date de derniere connexion
    private function last_connexion()
    {
        if ($this->session->logged) {
            // code...
            $date_connect=date('Y-m-d H:s:i');
            $data = array(
                'asset_last_login' => $date_connect,
                'session_ouverte' => 'oui',
            );
            // update
            $id = $this->session->id;
            $this->App_model->update_data($data, 'tb_ca_assets',  array('asset_id' => $id));
        }
    }

    public function index(){
        //chargement du tableau de bord
        $this->dashboard();
    }
    ########################################   *   ########################################
    #
    #						    # DASHBORAD FUNCTIONS
    #
    ########################################   *   ########################################

    public function dashboard()
    {
        //set page title
        $data['title'] = "Page de demarrage administrateur";
        //show all users
        $data['managers'] = $this->App_model->get('tb_ca_assets', 'asset_date_created')->result();
        $data['view'] = 'users/dashboard/index';
        $this->load->view('users/users_main', $data);
    }

    ########################################   *   ########################################
    #
    #								 # AGENT FUNCTIONS
    #
    ########################################   *   ########################################

    /**
     *@ Add data
     */
    public function addForm()
    {
        #=================forms information======================
        $type_view = ($this->uri->segment(3)!="" ? $this->uri->segment(3) : $this->session->type);
        $page = ($this->uri->segment(4)!="" ? $this->uri->segment(4) : $this->session->page);

        $data['managers'] = $this->App_model->get('tb_ca_assets', 'asset_date_created')->result();

        //set title
        $data['title'] = "$type_view | $page";
        $data['view'] = 'users/'.$type_view.'/'.$page;
        $this->load->view('users/users_main', $data);
    }

    /**
     *@ Update data
     */
    public function updateForm()
    {

        #=======================forms update data====================
        $id = $this->uri->segment(4);
        //infos sessions utilisateurs for edit
        $data['agents'] = $this->App_model->get_info_by_table_by_id($id, 'tb_ca_assets', 'asset_id');
        $data['managers'] = $this->App_model->get('tb_ca_assets', 'asset_date_created')->result();

            #=================Links infos======================
        $type_view = ($this->uri->segment(3)!="" ? $this->uri->segment(3) : $this->session->type);
        $page = ($this->uri->segment(4) !="" ? $this->uri->segment(4) : $this->session->page);

        //set title
        $data['title'] = "$type_view | $page";

        $data['view'] = 'users/'.$type_view.'/'.$page;
        $this->load->view('users/users_main', $data);
    }

    #====================================edition du profil utilisateur===============================charger vue profil

    /**
     * @param $type
     */
    public function changePassword()
    {
        $id = $this->session->id;
        $data['agents'] = $this->App_model->get_onces($id, 'tb_ca_assets', 'id_asset');

        $data['title'] = "Modification du mot de passe utilisateur";
        $data['view'] = 'users/profil/change_password';
        $this->load->view('users/users_main', $data);
    }
    /**
     * @param $type
     * user profil
     */
    public function monProfil()
    {
        $id = $this->session->id;
        $data['agents'] = $this->App_model->get_onces($id, 'tb_ca_assets', 'id_asset');

        $data['title'] = "Gestion du profil admin";
        $data['view'] = 'users/profil/index';
        $this->load->view('users/users_main', $data);
    }
    //Traitement de la mise à jour des informations du profil
    //fonction de modification du mot de passe proprement-dite
    function updateProfil()
    {
        $data['title'] = "Gestion du profil utilisateur";
        $new_password = $this->input->post('new_password');
        $confirm_password = $this->input->post('confirm_password');

        $options = array(
            'cost' => 12,);
        $anc_mot_pass = password_hash($this->input->post('anc_mot_pass'), PASSWORD_BCRYPT, $options);
        $validate = array();

        $this->form_validation->set_rules('new_password', 'new_password', 'min_length[6]|max_length[12]',
            array(
                'min_length' => 'Le champ %s doit contenir au moins huit caractères',
                'max_length' => 'Le champ %s doit contenir au plus douze caractères'
            ));

        $this->form_validation->set_rules('confirm_password', 'confirm_password', 'matches[new_password]',
            array(
                'matches' => 'Le champ %s doit correspondre avec le champ Nouveau Mot de passe'
            ));

        $anc_mot_pass_db = $this->Generic_model->get_unique('tb_ca_assets',
            array('asset_username' => $this->session->username))->asset_password;

        $this->form_validation->set_data(array_merge($validate, compact('new_password', 'confirm_password')));

        if ($this->form_validation->run()) {

            if ($anc_mot_pass != $anc_mot_pass_db) {
                //$asset_password=$nvo_mot_pass;
                $asset_password = empty($new_password) ? $anc_mot_pass : password_hash($new_password, PASSWORD_BCRYPT, $options);

                $data_ut = compact('asset_password');

                if ($this->Generic_model->set_update('tb_ca_assets', $data_ut,
                    array('asset_username' => $this->session->username))) {

                    //redirection with message notification success
                    $this->get_msg(' Mise à jour de votre mot de passe utilisateur effectuée avec succès', 'success');
                    redirect('admin/dashboard');

                } else {
                    $this->get_msg("Impossible de mettre à jour votre mot de passe utilisateur !");
                    $data['view'] = 'users/vue_profil_utilisateur';
                    $this->load->view('users/users_main', $data);
                }
            } else {
                $error_anc_mot_pass = TRUE;
                $this->session->set_flashdata(compact('error_anc_mot_pass'));
                $this->get_msg("Impossible de mettre à jour les données car votre 
                mot de passe en cours est incorrect");
                $data['view'] = 'users/vue_profil_utilisateur';
                $this->load->view('users/users_main', $data);
            }
            //redirect('agent/vue_profil');
        } else {
            $this->get_msg("Mise à jour du mot de passe non effectuée en raison d'une erreur survenue 
            lors de la validation de données !");
            $data['view'] = 'users/vue_profil_utilisateur';
            $this->load->view('users/users_main', $data);
        }
    }



    public function _menu_sortie($output = null)
    {
        //load view main
        $this->load->view('users/users_main.php', (array)$output);
    }

    //Show megamain page with css and js files
    public function megamain_management()
    {
        //affichage des operations des agents
        $this->_menu_sortie((object)array('output' => '', 'js_files' => array(), 'css_files' => array()));
    }

    //contact from form contact
    public function factures()
    {
        //create object from grocerycrud librairie
        $crud = new grocery_CRUD();
        //set table name
        $crud->set_table('tb_zad_factures');
        $crud->set_subject('Facture');
        $crud->set_relation('client_sid', 'tb_zad_clients', 'client_name');
        $crud->display_as('client_id', 'Client');
        $crud->set_relation('order_sid', 'tb_zad_commandes', 'order_id');
        $crud->display_as('order_id', 'Commande');

        $crud->unset_clone();
        //$crud->unset_edit();
       // $crud->unset_add();
        $crud->unset_delete();
        $output = $crud->render();
        //redirect to megamain page
        $this->_menu_sortie($output);
    }
    //contact from form contact
    public function commandes()
    {
        //create object from grocerycrud librairie
        $crud = new grocery_CRUD();
        //set table name
        $crud->set_table('tb_zad_commandes');
        $crud->set_subject('commande');
        $crud->set_relation('client_sid', 'tb_zad_clients', 'client_name');
        $crud->display_as('client_id', 'Client');

        $crud->unset_clone();
        //$crud->unset_edit();
       //$crud->unset_add();
        $crud->unset_delete();
        $output = $crud->render();
        //redirect to megamain page
        $this->_menu_sortie($output);
    }

    //contact from form contact
    public function detailsCommandes()
    {
        //create object from grocerycrud librairie
        $crud = new grocery_CRUD();
        //set table name
        $crud->set_table('tb_zad_achats');
        $crud->set_subject('Ligne commande');
        $crud->set_relation('order_sid', 'tb_zad_commandes', 'order_id');
        $crud->display_as('order_id', 'Commande');
        $crud->set_relation('product_sid', 'tb_zad_products', 'product_title');
        $crud->display_as('product_id', 'Produit');

        $crud->unset_clone();
        $crud->unset_edit();
        $crud->unset_add();
        $crud->unset_delete();
        $output = $crud->render();
        //redirect to megamain page
        $this->_menu_sortie($output);
    }

    //contact from form contact
    public function products()
    {
        //create object from grocerycrud librairie
        $crud = new grocery_CRUD();
        //set table name
        $crud->set_table('tb_zad_products');
        $crud->set_subject('produits');
        $crud->set_relation('mark_sid', 'tb_zad_marques', 'mark_name');
        $crud->display_as('mark_id', 'Marque produit');

        $crud->set_field_upload('product_image', 'assets/uploads/images/products');
        $crud->set_field_upload('image_deux', 'assets/uploads/images/products');
        $crud->set_field_upload('image_trois', 'assets/uploads/images/products');
        $crud->unset_clone();
        $crud->unset_edit();
        $crud->unset_add();
        $crud->unset_delete();
        $output = $crud->render();
        //redirect to megamain page
        $this->_menu_sortie($output);
    }
    //contact from form contact
    public function marquesProducts()
    {
        //create object from grocerycrud librairie
        $crud = new grocery_CRUD();
        //set table name
        $crud->set_table('tb_zad_marques');
        $crud->set_subject('Marque produit');
        $crud->set_field_upload('mark_image', 'assets/uploads/images/products');
        $crud->unset_clone();
        $crud->unset_edit();
        $crud->unset_add();
        $crud->unset_delete();

        $output = $crud->render();
        //redirect to megamain page
        $this->_menu_sortie($output);
    }

    public function clients()
    {
        //create object from grocerycrud librairie
        $crud = new grocery_CRUD();
        //set table name
        $crud->set_table('tb_zad_clients');
        $crud->set_subject('Client');
        $crud->unset_clone();
        //$crud->unset_edit();
        //$crud->unset_add();
        $crud->unset_delete();

        $output = $crud->render();
        //redirect to megamain page
        $this->_menu_sortie($output);
    }

    #===================================deconnexon - fermeture de session===========================================
    public function logout()
    {
        $data = array(
            'session_ouverte' => 'non',
        );
        // update
        $id = $this->session->id;
        $this->App_model->update_data($data, 'tb_ca_assets', array('asset_id' => $id));
        $this->session->sess_destroy();
        return redirect(base_url() . 'security/session');
    }
}
