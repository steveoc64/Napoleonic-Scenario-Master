<?php

class Scenarios extends MY_Controller {

	function index ($offset = 0) {
		
		///////////////////////////////////////////
		// Create basic form
		$form = new grocery_CRUD('Napoleonic Scenarios');
		$form->set_theme('flexigrid');
		$form->set_table('scenario');
		$form->set_subject('Scenario Data');
		$form->order_by('scenario');

		// Fields and Columns
    		$form->columns('scenario','descr','historical','year','start_time','turn_length','user_id');
    		$form->fields('scenario','descr','historical','year','start_time','turn_length','overall_map','video_intro','user_id');
		$form->required_fields('scenario');
		$form->change_field_type('start_time','datetime');
		$form->change_field_type('user_id','hidden');
		$form->change_field_type('historical','enum');
		$form->unset_texteditor('overall_map','video_intro');

		// relations
		$form->set_relation('user_id','user','username'); $form->display_as('user_id','Author');

		// Rules
		$form->callback_before_insert(array($this,'set_post_userid'));
		$form->callback_can_edit(array($this,'can_edit_scenario'));
		
		$this->render($form->render());

	}
	function can_edit_scenario ($key) {
		$user_id = $this->db->where("id",$key)->get('scenario')->row()->user_id;
		return  ($user_id == $this->session->userdata['user_id']);
	}

}


?>
