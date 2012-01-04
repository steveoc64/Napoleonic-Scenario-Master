<?php

class Site extends CI_Controller 
{
	function __construct()
	{
		parent::__construct();
		$this->is_logged_in();
	}

	function render ($title, $contents) {
		$contents->title = $title;
		$this->load->view ('crud_template', $contents);
	}
	function render_header ($contents) {
		$this->load->view ('crud_header',$contents);
	}
	function render_body ($title, $contents) {
		$contents->title = $title;
		$this->load->view ('crud_body', $contents);
	}
	function render_footer () {
		$this->load->view ('crud_footer');
	}

	function index()
	{
		$data['main_content'] = 'logged_in';
		$data['menu'] = 'menu';
		$this->load->view('include/template', $data);		
	}
	
	function is_logged_in()
	{
		$is_logged_in = $this->session->userdata('is_logged_in');
		if(!isset($is_logged_in) || $is_logged_in != true)
		{
			echo 'You don\'t have permission to access this page. <a href="../login">Login</a>';	
			die();		
			//$this->load->view('login_form');
		}		

		// We are logged in, so load a few libs now
		$this->load->library('grocery_CRUD');	
	}	

	function logout() {
		$this->session->sess_destroy();
		redirect('/');
	}

	function game() {
		$data['main_content'] = 'logged_in';
		$data['menu'] = 'menu';
		$this->load->view('include/template', $data);		
	}

	function scenarios() {
		$data['main_content'] = 'logged_in';
		$data['menu'] = 'menu';
		$this->load->view('include/template', $data);		
	}

	////////////////////////////////////////////////////////////////////////////////
	//  Nations maintenance
	function nations($offset = 0) {
     
		// Create basic form
		$form = new grocery_CRUD();
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
		$form->callback_before_insert(array($this,'add_nation'));
		$form->callback_can_edit(array($this,'can_edit_nation'));
		$form->set_field_upload('flag','content/flags');
		
		$this->render('Nations of the Napoleonic Wars', $form->render());
	}
	function add_nation ($post) {
		// set the author to the current user
		$post['user_id'] = $this->session->userdata['user_id'];
		return $post;
	}
	function can_edit_nation ($key) {
		$q = $this->db->query("select user_id from nation where id='$key'");
		$row = $q->row();
		$retval =  ($row->user_id == $this->session->userdata['user_id']);
		return $retval;
	}


	////////////////////////////////////////////////////////////////////////////////
	//  Unit maintenance
	function units() {

		// Create basic form
		$form = new grocery_CRUD();
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
		$form->callback_before_insert(array($this,'add_unit'));
		$form->callback_before_update(array($this,'update_unit'));
		$form->callback_can_edit(array($this,'can_edit_unit'));
		$form->is_link('link');

		$this->render('Napoleonic Units', $form->render());
	}
	function add_unit ($post) {
		// set the author to the current user
		$post['user_id'] = $this->session->userdata['user_id'];
		return $post;
	}
	function update_unit ($post) {
		// set the author to the current user
		$post['user_id'] = $this->session->userdata['user_id'];
		return $post;
	}
	function can_edit_unit ($key) {
		$q = $this->db->query("select user_id from unit where id='$key'");
		$row = $q->row();
		$retval =  ($row->user_id == $this->session->userdata['user_id']);
		return $retval;
	}


	////////////////////////////////////////////////////////////////////////////////
	//  Unit maintenance
	function cards() {
		$data['main_content'] = 'logged_in';
		$data['menu'] = 'menu';
		$this->load->view('include/template', $data);		
	}
	
	////////////////////////////////////////////////////////////////////////////////
	//  Data maintenance
	function data() {

		////////////////////////////////////////
		// Create basic form - Command Types
		$form = new grocery_CRUD();
		$form->set_theme('flexigrid');
		$form->set_table('command_types');
		$form->set_subject('Command Types');

		// Fields and Columns
    		$form->columns('name','radius','change_order');
		$form->display_as('name','Command Type');
		$form->display_as('radius','Command Radius (inches)');
		$form->display_as('change_order','Change Order Roll (D10)');

		// Rules
		$form->unset_operations();

		$_ = $form->render();
		$this->render_header($_);
		$this->render_body('Command Ratings', $_);

		////////////////////////////////////////
		// Create basic form - Skirmisher Ratings
		$form = new grocery_CRUD();
		$form->set_theme('flexigrid');
		$form->set_table('skirmish_rating');
		$form->set_subject('Skirmisher Ratings');

		// Fields and Columns
    		$form->columns('name','range','chance_to_hit');
		$form->display_as('name','Skirmisher Rating');
		$form->display_as('range','Firing Range (inches)');
		$form->display_as('chance_to_hit','Score to Hit (D10)');

		// Rules
		$form->unset_operations();

		$_ = $form->render();
		$this->render_body('Skirmisher Ratings', $_);


		$this->render_footer();
	}

	////////////////////////////////////////////////////////////////////////////////
	// Combat Charts
	function charts() {
		$data['main_content'] = 'charts';
		$data['menu'] = 'menu';
		$this->load->view('include/template', $data);		
	}

	////////////////////////////////////////////////////////////////////////////////
	// Republique Rules
	function rules() {
		$data['main_content'] = 'rules';
		$data['menu'] = 'menu';
		$this->load->view('include/template', $data);		
	}


}
