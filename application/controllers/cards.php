<?php

class Cards extends MY_Controller 
{
	////////////////////////////////////////////////////////////////////////////////
	//  Cards maintenance
	function index() {

		// Create basic form
		$form = new grocery_CRUD('Cards to be played during a Game');
		$form->set_theme('flexigrid');
		$form->set_table('cards');
		$form->set_subject('Cards');

		// Fields and Columns
    		$form->columns('name','descr','side_id','flag_end_turn','flag_end_active_turn','flag_reinforcement','flag_sticky','user_id');
    		$form->fields('name','descr','side_id','flag_end_turn','flag_end_active_turn','flag_reinforcement','flag_sticky','user_id');
		$form->required_fields('name','descr');
		$form->change_field_type('user_id','invisible');
		$form->display_as('side_id','(F)rench<br>(A)llied<br>(E)ither<br>(B)oth');
		$form->display_as('flag_end_turn','Flag<br>End Turn');
		$form->display_as('flag_end_active_turn','Flag<br>End Active Turn');
		$form->display_as('flag_reinforcement','Flag<br>Reinforcement');
		$form->display_as('flag_sticky','Flag<br>Applies till End of Turn');
		$form->change_field_type('side_id','enum');
		$form->change_field_type('flag_end_turn','enum');
		$form->change_field_type('flag_end_active_turn','enum');
		$form->change_field_type('flag_reinforcement','enum');
		$form->change_field_type('flag_sticky','enum');

		// Relations
		$form->set_relation('user_id','user','username'); $form->display_as('user_id','Author');
		
		// Rules
		$form->callback_before_insert(array($this,'set_post_userid'));
		$form->callback_can_edit(array($this,'can_edit_card'));

		$this->render($form->render());
	}

	function can_edit_card ($key) {
		$user_id = $this->db->where("id",$key)->get('cards')->row()->user_id;
		return  ($user_id == $this->session->userdata['user_id']);
	}
}
