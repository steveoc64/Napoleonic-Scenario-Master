<?php

class Game extends MY_Controller {

	function index ($offset = 0) {
		
		// Create basic form
		$form = new grocery_CRUD();
		$form->set_theme('flexigrid');
		$form->set_table('game');
		$form->set_subject('Game Data');
		$form->order_by('name');

		// Fields and Columns
    		$form->columns('name','scenario_id','date_played','date_finished','location','players','result','user_id');
    		$form->fields('name','scenario_id','date_played','date_finished','location','players','result','user_id','notes');
		$form->required_fields('name');
		$form->change_field_type('date_played','datetime');
		$form->change_field_type('date_finished','datetime');
		$form->change_field_type('user_id','invisible');
		$form->unset_texteditor(array('location','players'));
		$form->display_as('scenarion_id','Scenario');

		// relations
		$form->set_relation('user_id','user','username'); $form->display_as('user_id','Author');
		$form->set_relation('scenario_id','scenario','descr'); 

		// Rules
		//$form->unset_delete();
		$form->callback_before_insert(array($this,'set_post_userid'));
		$form->callback_can_edit(array($this,'can_edit_game'));
		
		$this->render('Napoleonic Wargames in Progress', $form->render());

	}
	function can_edit_game ($key) {
		$q = $this->db->query("select user_id from game where id='$key'");
		$row = $q->row();
		$retval =  ($row->user_id == $this->session->userdata['user_id']);
		return $retval;
	}

}


?>
