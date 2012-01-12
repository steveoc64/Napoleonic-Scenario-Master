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
    		$form->fields('scenario','descr','historical','year','start_time','turn_length','nations','overall_map','video_intro','user_id');
		$form->required_fields('scenario');
		$form->change_field_type('start_time','datetime');
		$form->change_field_type('user_id','hidden');
		$form->change_field_type('historical','enum');
		$form->unset_texteditor('overall_map','video_intro');

		// relations
		$form->set_relation('user_id','user','username'); $form->display_as('user_id','Author');
		$form->set_relation_n_n('nations','scenario_nation','nation','scenario_id','nation_id','name');

		// Rules
		$form->callback_before_insert(array($this,'set_post_userid'));
		$form->callback_can_edit(array($this,'can_edit_scenario'));
		
		///////////////////////////////////////////
		// Edit Nations used in this scenario
		$form2 = new grocery_CRUD('Details on Nations in this Scenario');
		$form2->set_theme('flexigrid');
		$form2->set_table('scenario_nation');
		$form2->set_subject('Scenario Data');

		// Fields and Columns
    		$form2->columns('nation_id','blinds','primes','rallies','player_briefing','player_map');
		$form2->set_field_upload('player_map','content/maps');
		$form->change_field_type('scenario_id','invisible');

		// relations
		$form2->set_relation('nation_id','nation','name'); $form->display_as('nation_id','Nation');
		$form2->unset_delete();
		$form2->unset_view();

		// Rules
		//$form2->callback_can_edit(array($this,'can_edit_scenario_nation'));
		$form2->chain_to($form,'scenario_id');
	
		$this->render($form->render());

	}
	function can_edit_scenario ($key) {
		$user_id = $this->db->where("id",$key)->get('scenario')->row()->user_id;
		return  ($user_id == $this->session->userdata['user_id']);
	}

}


?>
