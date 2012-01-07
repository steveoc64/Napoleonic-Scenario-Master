<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 

class MY_Controller extends CI_Controller {


	public function __construct() {
		parent::__construct();
		$this->is_logged_in();
	}		

	protected function is_logged_in()
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

	function render ($title, $contents) {
		if (!is_object($contents)) {
			$new_contents->output = $contents;
			$new_contents->css_files = array();
			$new_contents->js_files = array();
			$contents = $new_contents;
		}
		$contents->title = $title;
		$this->load->view ('crud_header',$contents);
		$this->load->view ('crud_body', $contents);
		$this->load->view ('crud_footer');
	}

	function render_header ($contents) {
		if (!is_object($contents)) {
			$new_contents->output = $contents;
			$new_contents->css_files = array();
			$new_contents->js_files = array();
			$contents = $new_contents;
		}
		$this->load->view ('crud_header',$contents);
	}

	function render_body ($title, $contents) {
		if (!is_object($contents)) {
			$new_contents->output = $contents;
			$new_contents->css_files = array();
			$new_contents->js_files = array();
			$contents = $new_contents;
		}
		$contents->title = $title;
		$this->load->view ('crud_body', $contents);
	}

	function render_footer () {
		$this->load->view ('crud_footer');
	}

	function set_post_userid($post) {
		// set the user_id field in the POST data to the current user
		// Do this for all inserts to stamp the author
		$post['user_id'] = $this->session->userdata['user_id'];
		return $post;
	}

}

?>
