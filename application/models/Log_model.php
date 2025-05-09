<?php
defined('BASEPATH') or exit('No direct script access allowed');


/**
 * Deskripsi : Log_model ini berisi query untuk melakukan fungsi log activity
 * Powered by : CodeIgniter
 * Author : Argya Rajaswa
 * Email : arrajzgay@gmail.com
 * WA : 081333296345
 */




class Log_model extends CI_Model
{
    public function save_log($param)
    {
        $query = $this->db->insert_string('tbl_log', $param);
        $ex    = $this->db->query($query);
        return $this->db->affected_rows($query);
    }

    public function get_activity_log()
    {
        $this->db->order_by('log_time', 'DESC');
        return $this->db->get('tbl_log', 8)->result();
    }
}
