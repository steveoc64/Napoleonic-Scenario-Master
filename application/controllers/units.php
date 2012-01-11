<?php

class Units extends MY_Controller 
{
	////////////////////////////////////////////////////////////////////////////////
	//  Unit maintenance
	function index() {

		// Create basic form
		$form = new grocery_CRUD('Units of the Napoleonic Wars');
		$form->set_theme('flexigrid');
		$form->set_table('unit');
		$form->set_subject('Unit');
		$form->where('unit.id > 1');

		// Fields and Columns
    		$form->columns('nation_id','year','name','parent_id','unit_type','leader','command_type',
			'num_bases','troop_grade','skirmishers','skirmish_rating','user_id');
		$form->fields('nation_id','parent_id','year','name','unit_type','leader','portrait','command_type',
			'artillery','cavalry','infantry','user_id',
			'num_bases','troop_grade','skirmishers','skirmish_rating','photo','link','notes');
		$form->required_fields('name','year');
		$form->unset_texteditor(array('artillery','cavalry','infantry'));
		$form->change_field_type('user_id','invisible');
		$form->set_field_upload('portrait','content/portraits');
		$form->set_field_upload('photo','content/units');

		// Relations
		$form->set_relation('nation_id','nation','name'); $form->display_as('nation_id','Nation');
		$form->set_relation('parent_id','unit',"name"); $form->display_as('parent_id','Parent Formation');
		$form->set_relation('user_id','user','username'); $form->display_as('user_id','Author');
		$form->set_relation('command_type','command_types','name'); 
		$form->set_relation('troop_grade','troop_grades','name'); 
		$form->set_relation('skirmish_rating','skirmish_rating','name'); 
		$form->display_as('skirmishers','Sk');
		$form->display_as('skirmish_rating','Sk Rating');
		$form->set_relation('unit_type','unit_type','name'); 
		
		// Rules
		$form->callback_before_insert(array($this,'set_post_userid'));
		$form->callback_can_edit(array($this,'can_edit_unit'));
		$form->is_link('link');

		///////////////////////////////////////////////////
		// Chain a list of child units underneath this unit
		$form2 = new grocery_CRUD('Sub Units of this Unit');
		$form2->set_theme('flexigrid');
		$form2->set_table('unit');

		// Fields and Columns
    		$form2->columns('name','unit_type','leader','command_type',
			'num_bases','troop_grade','skirmishers','skirmish_rating','user_id');
		$form2->set_field_upload('portrait','content/portraits');
		$form2->set_field_upload('photo','content/units');
		$form2->is_link('link');

		// Relations
		$form2->set_relation('user_id','user','username'); $form->display_as('user_id','Author');
		$form2->set_relation('command_type','command_types','name'); 
		$form2->set_relation('troop_grade','troop_grades','name'); 
		$form2->set_relation('skirmish_rating','skirmish_rating','name'); 
		$form2->display_as('skirmishers','Sk');
		$form2->display_as('skirmish_rating','Sk Rating');
		$form2->set_relation('unit_type','unit_type','name'); 
		
		// Rules
		$form2->unset_add();
		$form2->chain_to($form,'parent_id');

		$this->render($form->render());
	}
	function can_edit_unit ($key) {
		$user_id = $this->db->where("id",$key)->get('unit')->row()->user_id;
		return  ($user_id == $this->session->userdata['user_id']);
	}
}
