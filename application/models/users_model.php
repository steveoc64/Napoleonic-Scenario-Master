<?php

class Users_model extends CI_Model {

	function validate()
	{
		$username = $this->input->post('username');
		$this->db->where('username', $username);
		$this->db->where('password', md5($this->input->post('password')));
		$query = $this->db->get('user');
		
		if($query->num_rows == 1)
		{
			$row = $query->row();
			$this->session->set_userdata('user_id',$row->id);
			$this->db->query("update user set last_login=now() where username='$username'");
			$userdata = $this->session->all_userdata();
				$agent = $userdata['user_agent'];
				$ip_address = $userdata['ip_address'];
			$this->db->query("insert into logins (user_id,user_agent,ip_address) values ($row->id, '$agent','$ip_address')");
			return true;
		}
	}
	
	function create_user()
	{
		
		$new_member_insert_data = array(
			'email' => $this->input->post('email_address'),			
			'username' => $this->input->post('username'),
			'password' => md5($this->input->post('password')),
			'admin' => 'F'						
		);
		
		$insert = $this->db->insert('user', $new_member_insert_data);
		return $insert;
	}
}
