<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Secure_model extends CI_Model {
    /**
     * @param $username
     * @param $password
     * @return bool
     */
    public function login_data($username, $password){

        $this->db->where('asset_email', $username);
        $query = $this->db->get('tb_ca_assets')->result();
        if($query){
            if(password_verify($password,$query[0]->asset_password)){
                return $query[0];
            }else{
                return false;
            }
        }else{
            $this->db->where('asset_login', $username);
            $query = $this->db->get('tb_ca_assets')->result();
            if($query){
                if(password_verify($password,$query[0]->asset_password)){
                    return $query[0];
                }else{
                    return false;
                }
            }else{
                return false;
            }
        }
    }


    /**
     * get All Administrator
     */
    public function getAllAdmin(){

        $this->db->select('*');
        $this->db->from('tb_ca_assets');
        $this->db->where('asset_type', 'administrateur');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return false;
        }

    } /**
     * get All Administrator
     */
    public function getAllUsers(){

        $this->db->select('*');
        $this->db->from('tb_ca_assets');
        $this->db->where('asset_type', 'utilisateur');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return false;
        }

    }


    public function info_by_email($email){

        $this->db->where('asset_email', $email);
        $query = $this->db->get('tb_ca_assets')->result();
        if($query){
            if($query[0] != null){
                return $query[0];
            }else return false;

        }else{
            return false;
        }
    }

    public function admin_existant()
    {
        $this->db->select('*');
        $this->db->from('tb_ca_assets');
        $this->db->where('asset_type', 'administrateur');
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return false;
        }
    }
    //recuperer les infos d'un user existant
    public function user_existant($username, $email){

        $this->db->where('asset_login', $username);
        $this->db->where('asset_email', $email);
        $query = $this->db->get('tb_ca_assets')->result();
        if($query){
            return $query[0];
        }else{
            return false;
        }
    }

    /** All Data In table
     * @param $table
     * @param $champs
     * @param $where
     * @param $critere
     * @return bool
     */
    public function getAssetData($table, $champs, $where=array()){

        $this->db->select($champs);
        $this->db->from($table);
        $this->db->where($where);
        $query = $this->db->get();
        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return false;
        }
    }
}
