<?php

class Site extends CI_Controller 
{
	function __construct()
	{
		parent::__construct();
		$this->is_logged_in();
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
