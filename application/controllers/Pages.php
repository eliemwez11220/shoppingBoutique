<?php
defined('BASEPATH') OR exit('No direct script access allowed');

    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\Exception;

class Pages extends CI_Controller
{
    public function __construct()
    {
        parent:: __construct();

        $this->load->model('Produits_model');
    }
    
    public function view($page = 'home')
    {
        #Identifiant de la meme categorie
        //$categories = $this->App_model->get_unique(array('vue_categories_articles'),
            //array('post_id' => $postid))->category_sid;
        #Articles similaires ou de la meme categorie
        //$data['postsSimilaires'] = $this->App_model->get_response('vue_categories_articles',
           // array('post_statut' => "public", 'category_sid' => $categories), 'vue_categories_articles.post_date_created', 'DESC', '5');

       if ($page != 'home') {

           $data['articles'] = $this->Produits_model->get_response('tb_zad_products', [], 'tb_zad_products.product_created', 'DESC', '1');
           $data['produits'] = $this->Produits_model->get_response('tb_zad_products', [], 'tb_zad_products.product_created', 'DESC', '5', 1);
           $data['allProduits'] = $this->Produits_model->get_response('tb_zad_products', [], 'tb_zad_products.product_created', 'DESC', '15', 1);

          // $this->display($data['produits']);

          $data['title']=ucfirst($page); //Ceci recupere le nom de la page et l'affiche dans title en majusle sur la première lettre
          // $data['title'] = $page;
           $data['page'] = $page;
           $data['description'] = "Shopiza est un service de Digitafriza qui vous fournit des applications web et sites internet de vente en ligne.";
           //
           $this->load->view('includes/header', $data);
           $this->load->view('pages/'.$page, $data);
           $this->load->view('includes/footer', $data);
        } else {
           $data['articles'] = $this->Produits_model->get_response('tb_zad_products', [], 'tb_zad_products.product_created', 'DESC', '1');
           $data['produits'] = $this->Produits_model->get_response('tb_zad_products', [], 'tb_zad_products.product_created', 'DESC', '5', 1);
           $data['allProduits'] = $this->Produits_model->get_response('tb_zad_products', [], 'tb_zad_products.product_created', 'DESC', '15', 1);
            $data['title']=ucfirst($page); //Ceci recupere le nom de la page et l'affiche dans title en majusle sur la première lettre
            //$data['title'] = $page;
            $data['page'] = $page;
            $data['description'] = "Shopiza est un service de Digitafriza qui vous fournit des applications web et sites internet de vente en ligne.";
          //
           $this->load->view('includes/header', $data);
           $this->load->view('pages/home', $data);
           $this->load->view('includes/footer', $data);
        }
    }

    public function searchProducts(){

        $query = $this->input->post('critere');

        $data['resultats'] = $this->Produits_model->filter_data('tb_zad_products', array('product_title'=>$query),
            'tb_zad_products.product_created', 'DESC');

       //$this->display($data['resultats']);

        $data['title'] = "Resultats de recherche correspondant au critere - $query";
        $data['critere'] = $query;
        $data['page'] = "searchProducts";

        $this->load->view('includes/header', $data);
        $this->load->view('pages/searchProducts', $data);
        $this->load->view('includes/footer', $data);
    }
    /**
     * gestion des URL de la description de l'article
     */
    function str_to_noaccent($str)
    {
        $url = $str;
        $url = preg_replace('#Ç#', 'C', $url);
        $url = preg_replace('#ç#', 'c', $url);
        $url = preg_replace('#è|é|ê|ë#', 'e', $url);
        $url = preg_replace('#È|É|Ê|Ë#', 'E', $url);
        $url = preg_replace('#à|á|â|ã|ä|å#', 'a', $url);
        $url = preg_replace('#@|À|Á|Â|Ã|Ä|Å#', 'A', $url);
        $url = preg_replace('#ì|í|î|ï#', 'i', $url);
        $url = preg_replace('#Ì|Í|Î|Ï#', 'I', $url);
        $url = preg_replace('#ð|ò|ó|ô|õ|ö#', 'o', $url);
        $url = preg_replace('#Ò|Ó|Ô|Õ|Ö#', 'O', $url);
        $url = preg_replace('#ù|ú|û|ü#', 'u', $url);
        $url = preg_replace('#Ù|Ú|Û|Ü#', 'U', $url);
        $url = preg_replace('#ý|ÿ#', 'y', $url);
        $url = preg_replace('#Ý#', 'Y', $url);
        return ($url);
    }
    #======================================================================================================
    #============================envoi des mails de creation des comptes==================================

    public function sendMail($email, $username, $password, $subject)
    {
        require_once APPPATH.'PHPMailer/src/Exception.php';
        require_once APPPATH.'PHPMailer/src/PHPMailer.php';
        require_once APPPATH.'PHPMailer/src/SMTP.php';
        $from = "";
        $cc1 = "";
        $addresses = mb_split(";", $email);
        if (count($addresses) > 1) {
            $from = $addresses[0];
            $cc1 = $addresses[1];
        } else {
            $from = $email;
        }
        $mail = new PHPMailer(TRUE);
        try {
            $mail->setFrom('admin@congoagile.com', 'Digitafriza Administration');
            $mail->addAddress($from, '');
            if (count($addresses) > 1) {
                $mail->addCC($cc1);
            }
            $mail->addCC('shopiza@congoagile.com', 'Shopiza Support');
            $mail->Subject = $subject;

            $mail->isHTML(true);

            $mail->CharSet = 'UTF-8';

            $mail->Body = '<html><strong>Cher ' . $from . '<br/></strong> un compte d\'access a Agile Sante application 
                a été crée avec succès par un administrateur systeme.
            <strong> veuillez trouver ci-dessous les identifiants de connexion. <br/>Username:  ' . $username . '<br/>Mot de passe: ' . $password . '<br/></strong>
            <p> Veuillez suivre le lien ci-après pour vous connecter.</p><a href="https://digitafriza.congoagile.com"> 
            Agile Sante Application.</a></html>';

            /* SMTP parameters. */

            $mail->isSMTP();

            //$mail->SMTPDebug = 2;

            /* SMTP server address. */
            $mail->Host = 'mail.congoagile.com';

            /* Use SMTP authentication. */
            $mail->SMTPAuth = TRUE;

            /* Set the encryption system. */
            $mail->SMTPSecure = 'tls';

            /* SMTP authentication username. */
            $mail->Username = 'admin@congoagile.com';

            /* SMTP authentication password. */
            $mail->Password = 'congoagile2020';

            /* Set the SMTP port. */
            $mail->Port = 587;
            //$mail->Port = 465;

            $mail->SMTPOptions = array(
                'ssl' => array(
                    'verify_peer' => false,
                    'verify_peer_name' => false,
                    'allow_self_signed' => true
                )
            );
            /* Finally send the mail. */
            //$mail->send();
            //return $redirect;
            if (!$mail->send()) {
                echo 'Message could not be sent.';
                echo 'Mailer Error: ' . $mail->ErrorInfo;
            } else {
                echo 'Message has been sent';
            }

        } catch (Exception $e) {
            //return $redirect;
            //echo $e->errorMessage();
        }
    }
}
