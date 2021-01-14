<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Produits_model extends CI_Model
{

    public function get_result($table, $champ, $id)
    {
        return $this->db->get_where($table, array($champ => $id))->row_array();
    }

    public function get_unique($table, $where = array())
    {
        return $query = $this->db->get_where($table, $where)->row();
    }

    public function get_response($table, $where = array(), string $order_by = '', $order = '', $per_page = array(), $position = array())
    {
        $this->db->order_by($order_by, $order);
        $this->db->limit($per_page, $position);
        $query = $this->db->get_where($table, $where);
        return $query->result();
    }

    public function filter_data($table, $where = array(), string $order_by = '', $order = '')
    {
        //$this->db->where($where); $champCritere, $critere,
        $this->db->like($where);
        //$this->db->like($champCritere, $critere);
        $this->db->order_by($order_by, $order);
        $query = $this->db->get($table);

        if ($query->num_rows() > 0) {
            return $query->result();
        } else {
            return false;
        }
    }

    public function insert_data($table, $data)
    {
        return $this->db->insert($table, $data);
    }
    public function insert_multiple($table, $data)
    {
        return $this->db->insert_batch($table, $data);
    }


    public function update_data($table, $data,  $where)
    {
        return $this->db->update($table, $data, $where);
    }

}