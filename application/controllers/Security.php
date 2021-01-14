<?php
defined('BASEPATH') OR exit('No direct script access allowed');

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

class Security extends CI_Controller
{
    public function __construct()
    {
        parent:: __construct();
        // charge all models
        $this->load->model('Secure_model');
        $this->load->model('App_model');
    }

    public function session($page = 'login')
    {
        if ($page != 'login') {
            $data['title'] = ucfirst($page); //Ceci recupere le nom de la page et l'affiche dans title en majusle sur la première lettre
            //$data['title'] = $page;
            $data['page'] = $page;
            $data['description'] = "Shopiza est un service de Digitafriza qui vous fournit des applications web et sites internet de vente en ligne.";
            $this->load->view('session/' . $page, $data);
        } else {
            $data['title'] = ucfirst($page); //Ceci recupere le nom de la page et l'affiche dans title en majusle sur la première lettre
            //$data['title'] = $page;
            $data['page'] = $page;
            $data['description'] = "Shopiza est un service de Digitafriza qui vous fournit des applications web et sites internet de vente en ligne.";
            $this->load->view('session/login', $data);
        }
    }



    #=======================function create admin account activing all systeme
    public function createAccount()
    {
        # recuperation of username
        $this->form_validation->set_rules('nom_complet', 'nom_complet', 'required', array(
            'required' => 'Le nom complet est obligatoire',
        ));
        $this->form_validation->set_rules('username', 'Username', 'required', array(
            'required' => 'Le nom utilisateur est obligatoire',
        ));

        # recuperation of password
        $this->form_validation->set_rules('password', 'Paswword', 'min_length[5]|max_length[75]', 'required',
            array(
                'min_length' => 'Le champ %s doit contenir au moins cinq caractères',
                'max_length' => 'Le champ %s doit contenir au plus septante cinq caractères',
                'required' => 'Le champ %s est obligatoire',
            ));
        # confirmation mot de passe créé pour eviter la mauvaise saisie
        $this->form_validation->set_rules('password_confirmation', 'Password_confirmation', 'matches[password]',
            array(
                'matches' => 'Le champ %s doit correspondre avec le champ nouveau mot de passe'
            )
        );
        # verifie si les donnees du formulaire sont valides
        if ($this->form_validation->run()) {
            $asset_fullame = $this->input->post('nom_complet');
            $asset_login = $this->input->post('username');
            $asset_email = $this->input->post('email');
            $asset_type = 'administrateur';
            $asset_role = 'Super';
            $asset_statut = 'online';
            $group_sid = 1;
            $group_id = 1;
            $group_name = "administrateur";
            $group_privilege = "All";

            $options = array(
                'cost' => 12,
            );
            //cripter mot de passe par zip code
            $asset_password = password_hash($this->input->post('password'), PASSWORD_BCRYPT, $options);

            $groupData = compact('group_id', 'group_name', 'group_privilege');
            $data_admin = compact('asset_fullame', 'asset_login', 'asset_password', 'asset_type',
                'asset_email', 'asset_role', 'asset_statut', 'group_sid');

            //insertion de données dans la base puis teste de valdation
            if ($this->App_model->insert_data($groupData, 'tb_ca_groups')) {

                //insert into users data
                if ($this->App_model->insert_data($data_admin, 'tb_ca_assets')) {
                    //confirmation par message
                    $this->setNotifie("Le compte admin a ete creee avec succès!", 'success');
                    //Connexion automatique
                    $infos_admin = $this->Secure_model->infos_admin($asset_email, $asset_password);

                    // Creation du tableau de donnees de l'admin
                    $userdata = array(
                        'id' => $infos_admin->asset_id,
                        'fullname' => $infos_admin->asset_fullname,
                        'username' => $infos_admin->asset_login,
                        'email' => $infos_admin->asset_email,
                        'statut' => $infos_admin->asset_statut,
                        'active' => $infos_admin->session_ouverte,
                        'type' => $infos_admin->asset_type,
                        'role' => $infos_admin->asset_role,
                        'avatar' => $infos_admin->asset_avatar,
                        'job' => $infos_admin->asset_profession,
                        'etatcivil' => $infos_admin->asset_civilite,
                        'sexe' => $infos_admin->asset_genre,
                        'comments' => $infos_admin->asset_comments,
                        'phone' => $infos_admin->asset_phone,
                        'themeDefault' => $infos_admin->asset_theme_session,
                        'themeSession' => $infos_admin->asset_theme_session,
                        'last_login' => $infos_admin->asset_last_login,
                        'last_update' => $infos_admin->asset_last_update,
                        'groupe' => $infos_admin->group_sid,
                        'authentified_admin' => TRUE
                    );
                    // Stocker les infos admin dans la session
                    $this->session->set_userdata($userdata);
                    //message de bienvenue
                    $name_admin = ucfirst($asset_fullame);
                    $this->setNotifie("$name_admin, Bienvenue sur votre espace d'administration de 
                notre Application,
                         vous êtes connecté entant que Super Administrateur système", 'success');
                    // rediret admin
                    return redirect(base_url() . 'admin/dashboard');
                } else {
                    //si difficile de creer le compte admin
                    $this->setNotifie("Impossible de creer le compte administrateur");
                    return redirect(base_url() . 'secure/pages/secure');
                }

            } else {
                //si difficile de creer le compte admin
                $this->setNotifie("Impossible de creer le compte administrateur");
                return redirect(base_url() . 'secure/pages/secure');
            }
        } else {
            $this->setNotifie('');
            return redirect(base_url() . 'secure/pages/secure');
        }
    }

    /**
     * @Verifie datas coming from login form
     */
    public function login()
    {
        # recuperation of username
        $this->form_validation->set_rules('loginUsername', 'loginUsername', 'required', array(
            'required' => "%s est obligatoire",
        ));
        # recuperation of password
        $this->form_validation->set_rules('loginPassword', 'loginPassword', 'required', array(
            'required' => "%s est obligatoire",
        ));

        # verifie if datas are corrects and redirect
        if ($this->form_validation->run()) {

            $username = $this->input->post('loginUsername');
            $password = $this->input->post('loginPassword');
            $passwordSaved = $this->input->post('registerAgree');

            if ($this->Secure_model->login_data($username, $password)) {
                $infos_session = $this->Secure_model->login_data($username, $password);
                //$pass_code_default = "123456";
                if ($infos_session) {
                    $userdata = array(
                        'id' => $infos_session->asset_id,
                        'fullname' => $infos_session->asset_fullname,
                        'username' => $infos_session->asset_login,
                        'email' => $infos_session->asset_email,
                        'statut' => $infos_session->asset_statut,
                        'active' => $infos_session->session_ouverte,
                        'type' => $infos_session->asset_type,
                        'role' => $infos_session->asset_role,
                        'avatar' => $infos_session->asset_avatar,
                        'job' => $infos_session->asset_profession,
                        'etatcivil' => $infos_session->asset_civilite,
                        'sexe' => $infos_session->asset_genre,
                        'comments' => $infos_session->asset_biography,
                        'phone' => $infos_session->asset_phone,
                        'themeDefault' => $infos_session->asset_theme_session,
                        'themeSession' => $infos_session->asset_theme_session,
                        'last_login' => $infos_session->asset_last_login,
                        'last_update' => $infos_session->asset_last_update,
                        'groupe' => $infos_session->group_sid,
                        'logged' => TRUE
                    );
                    //verification du statut de l'agent
                    if ($infos_session->asset_statut == 'online') {

                        #save data in session
                        $this->session->set_userdata($userdata);
                        //if saved password
                        if (!empty($passwordSaved)) {
                            #ajout des elements à l'algorithme de cryptage.
                            $options = array(
                                'cost' => 12,
                            );
                            #Mise en tableau des informations du compte a créé
                            $data_saved = password_hash($password, PASSWORD_BCRYPT, $options);
                            $data = array(
                                'asset_password_saved' => $data_saved
                            );
                            //$this->display($data_saved);
                            #update saved password
                            $id = $this->session->id;
                            $this->App_model->update_data($data, 'tb_ca_assets',  array('asset_id' => $id));
                        }

                        #check user type
                        if ($infos_session->asset_type == 'administrateur') {

                            $username = ucfirst($this->session->fullname);
                            $this->setNotifie("$username, Bienvenue sur votre espace d'administration de l'Application, 
                                            vous êtes connecté entant qu'admin systeme", 'success');
                            return redirect(base_url() . 'admin/dashboard');
                        } elseif ($infos_session->asset_type == 'utilisateur') {

                            $username = strtoupper($infos_session->asset_fullname);
                            $this->setNotifie("$username, Bienvenue sur votre espace d'administration
                                 de l'Application, vous êtes connecté entant qu'utilisateur", 'success');
                            return redirect(base_url() . 'users/dashboard');
                        } else {
                            $this->setNotifie("$username, sorry ! Vous tenter de vous connecter sur une application frauduleusement");
                            return redirect(base_url() . 'security');
                        }

                    } else {
                        # Redirect to login page and show the message error
                        $data['page_error'] = "Votre compte est déjà bloqué. 
                                                Veuillez conctacter votre webmaster ou un admin systeme";
                        $data['title'] = "Account bloqued";
                        $data['page'] = "Connexion";
                        $this->load->view('security/session/login', $data);
                    }
                } else {
                    // redirect if username or password is not true
                    $data['page_error'] = "Compte non existant dans le système.";
                    $data['title'] = "User not found";
                    $data['page'] = "Connexion";
                    $this->load->view('security/session/login', $data);
                }
            }  else {
                // redirect if username or password is not true
                $data['page_error'] = "Vous avez introduit de mauvais identifiants. Veuillez corriger et reessayer";
                $data['title'] = "Identifiants non existant ";
                $data['page'] = "Connexion";
                $this->load->view('security/session/login', $data);
            }
        } else {
            // redirect if username or password is not true
            $data['page_error'] = "Vous devez disposer un compte pour accéder à cette application.
                         Veuillez conctacter votre webmaster ou un admin systeme pour plus de détails.";
            $data['title'] = "Identifiants non existant ";
            $data['page'] = "Connexion";
            $this->load->view('security/session/login', $data);
        }
    }
}