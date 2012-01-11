<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class Nations extends MY_Controller 
{
	
	////////////////////////////////////////////////////////////////////////////////
	//  Nations maintenance
	function index($offset = 0) 
	{
     
		// /////////////////////////////////////////////////////////
		// Create basic form for the top level - national list
		$form = new grocery_CRUD('Nations of the Napoleonic Wars');
		$form->set_theme('flexigrid');
		$form->set_table('nation');
		$form->set_subject('Nation Data');
		$form->order_by('name');

		// Fields and Columns
    		$form->columns('name','year','command_type','command_system','drill_system','descr','flag','user_id');
    		$form->fields('name','year','command_type','command_system','drill_system','descr','flag','music','user_id');
		$form->required_fields('name');
		$form->unset_texteditor(array('music'));
		//$form->unset_texteditor(array('descr'));

		// relations
		$form->set_relation('user_id','user','username'); $form->display_as('user_id','Author');
		$form->change_field_type('user_id','invisible');
		$form->set_relation('command_type','command_types','name'); 
		$form->set_relation('command_system','command_system','name'); 
		$form->set_relation('drill_system','drill_system','name'); 

		// Rules
		//$form->unset_delete();
		$form->callback_before_insert(array($this,'set_post_userid'));
		$form->callback_can_edit(array($this,'can_edit_nation'));
		$form->set_field_upload('flag','content/flags');
		
		//////////////////////////////////////////////////
		// Now add a related units list underneath
		$form2 = new grocery_CRUD('Units of this Nation');
		$form2->sub_list = true;
		$form2->set_theme('flexigrid');
		//$form2->set_theme('datatables');
		$form2->set_table('unit');
		$form2->set_subject('Unit');
		$form2->where('unit.id > 1');

		// Fields and Columns
    		$form2->columns('year','name','parent_id','unit_type','leader','command_type',
			'num_bases','troop_grade','skirmishers','skirmish_rating','user_id');
		$form2->fields('parent_id','year','name','unit_type','leader','portrait','command_type',
			'artillery','cavalry','infantry','user_id',
			'num_bases','troop_grade','skirmishers','skirmish_rating','photo','link','notes');
		$form2->required_fields('name','year');
		$form2->unset_texteditor(array('artillery','cavalry','infantry'));
		$form2->change_field_type('user_id','invisible');
		$form2->set_field_upload('portrait','content/portraits');
		$form2->set_field_upload('photo','content/units');

		// Relations
		$form2->set_relation('parent_id','unit',"name"); $form->display_as('parent_id','Parent Formation');
		$form2->set_relation('user_id','user','username'); $form->display_as('user_id','Author');
		$form2->set_relation('command_type','command_types','name'); 
		$form2->set_relation('troop_grade','troop_grades','name'); 
		$form2->set_relation('skirmish_rating','skirmish_rating','name'); 
		$form2->display_as('skirmishers','Sk');
		$form2->display_as('skirmish_rating','Sk Rating');
		$form2->set_relation('unit_type','unit_type','name'); 
		
		// Rules
		$form2->callback_before_insert(array($this,'add_unit'));
		$form2->callback_can_edit(array($this,'can_edit_unit'));
		$form2->is_link('link');
		$form2->chain_to($form,'unit.nation_id');

		///////////////////////////////////////////////////
		// Chain a list of child units underneath this unit
		$form3 = new grocery_CRUD('Sub Units of this Unit');
		$form3->set_theme('flexigrid');
		$form3->set_table('unit');

		// Fields and Columns
    		$form3->columns('name','unit_type','leader','command_type',
			'num_bases','troop_grade','skirmishers','skirmish_rating','user_id');

		// Relations
		$form3->set_relation('user_id','user','username'); $form->display_as('user_id','Author');
		$form3->set_relation('command_type','command_types','name'); 
		$form3->set_relation('troop_grade','troop_grades','name'); 
		$form3->set_relation('skirmish_rating','skirmish_rating','name'); 
		$form3->display_as('skirmishers','Sk');
		$form3->display_as('skirmish_rating','Sk Rating');
		$form3->set_relation('unit_type','unit_type','name'); 
		
		// Rules
		$form3->unset_add();
		$form3->chain_to($form2,'parent_id');

		// All done - render it now
		$this->render($form->render());
	}

	function add_unit($post) {
		$post['user_id'] = $this->session->userdata['user_id'];
		return $post;

	}

	function can_edit_nation ($key) {
		$q = $this->db->query("select user_id from nation where id='$key'");
		$row = $q->row();
		$retval =  ($row->user_id == $this->session->userdata['user_id']);
		return $retval;
	}
	function can_edit_unit ($key) {
		$q = $this->db->query("select user_id from unit where id='$key'");
		$row = $q->row();
		$retval =  ($row->user_id == $this->session->userdata['user_id']);
		return $retval;
	}

}
