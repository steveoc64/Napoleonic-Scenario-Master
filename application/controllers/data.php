<?php

class Data extends MY_Controller 
{
	function index()
	{
		////////////////////////////////////////////////////////////////////////////////
		//  Data maintenance
		$form = new grocery_CRUD('Data Tables');
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
		$this->render_body($_);

		////////////////////////////////////////
		// Create basic form - Skirmisher Ratings
		$form = new grocery_CRUD('Skirmisher Ratings');
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
		$this->render_body($_);


		$this->render_footer();
	}
}
