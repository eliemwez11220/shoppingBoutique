<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Errors extends CI_Controller
{
    public function __construct()
    {
        parent:: __construct();
    }
    public function error404(){
        $this->load->view("errors/error_404");
    }
}