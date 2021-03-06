<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
class admin_menu extends CI_Controller {
	
	var $is_ajax = false;
	var $cAutoId = 'admin_menu_id';
	var $cPrimaryId = '';
	var $cTable = 'admin_menu';
	var $controller = 'admin_menu';
	var $per_add = 1;
	var $per_edit = 1;
	var $per_delete = 1;
	var $per_view = 1;
	
	//parent constructor will load model inside it
	function __construct()
	{
		parent::__construct();
		$this->load->model('admin/mdl_admin_menu','am');
		$this->am->cTableName = $this->cTable;
		$this->am->cAutoId = $this->cAutoId;
		$this->is_ajax = $this->input->is_ajax_request();
		
		if($this->input->get('item_id') != '' || $this->input->post('item_id') != '')
			$this->cPrimaryId  = $this->am->cPrimaryId = _de($this->security->xss_clean($_REQUEST['item_id']));
		if((int)$this->session->userdata('admin_id')!=0)
		{
			$res = checkIsSuperAdmin();
			if(!$res)
			{
				setFlashMessage('error',getErrorMessageFromCode('01023'));
				adminRedirect('admin/dashboard');
			}
		}
	
		$this->chk_permission();		
	}
/**
+----------------------------------------------------+
	check permission for user
+----------------------------------------------------+
*/
	function chk_permission()
	{
		$per =  fetchPermission($this->controller);
		if(!empty($per))
		{
			$this->per_add = @$per['permission_add'];		
			$this->per_edit = @$per['permission_edit'];		
			$this->per_delete = @$per['permission_delete'];		
			$this->per_view = @$per['permission_view'];		
		}
		else 
		{
			showPermissionDenied();
		}
	}	
/*
+-----------------------------------------+
	This function will remap url for admin,
	and remove unnecesary name from url.
	For example : if we don't want index
	strgin in url while listin item, we can 
	remove it using this function
+-----------------------------------------+
*/	
	function _remap($method,$params)
	{
		if(method_exists($this,$method))
			return call_user_func_array(array($this, $method), $params);
		else
		{
			$para[0] = $method;
			
			if(count($params) > 0)
				$para = array_merge($para,$params);
			
			//here we are going to call out custom function for load specific menu.
			call_user_func_array(array($this,'index'),$para);
		}
	}
/*
+--------------------------------------------------+
	function will check class module, return error
	if alias already exist.
+--------------------------------------------------+
*/	
	function checkClassKey($str)
	{
		if($this->cPrimaryId)
			$this->db->where($this->cAutoId." !=",$this->cPrimaryId);
		
		$c = $this->db->where('am_class_name',$str)->get($this->cTable)->num_rows();
		if($c > 0)
		{
			$this->form_validation->set_message('checkClassKey','This Classkey '.$str.' already exist in database, please try different.');
			return false;
		}
		else
			return true;
	}
	
	function index($start = 0)
	{
		$logType = 'V';
		saveAdminLog($this->router->class, 'Admin Menu ', $this->cTable, $this->cAutoId, 0, $logType);
		if($this->per_view != 0)
		{
			setFlashMessage('error',getErrorMessageFromCode('01010'));
			showPermissionDenied();
		}
		$num = $this->am->getData();
		$data = array();
		$data['listArr'] =$num->result_array();
/*		$data = pagiationData('admin/'.$this->controller,$num->num_rows(),$start,3);
		//echo $this->db->last_query();
		
		$data['start'] = $start; //starting position of records
		$data['total_records'] = $num->num_rows(); // total num of records
		$data['per_page_drop'] = per_page_drop(); // per page dropdown
*/	  $data['srt'] = $this->input->get('s'); // sort order
		$data['field'] = $this->input->get('f'); // sort field name
		$data['menu_name_filter'] = $this->input->get('menu_name_filter'); // filter by category name
		$data['class_name_filter'] = $this->input->get('class_name_filter'); // filter by category name
		$data['status_filter'] = ($this->input->get('status_filter') != '')?$this->input->get('status_filter'):'-1'; // filter by status

		if($this->is_ajax)
		{
			$this->load->view('admin/'.$this->controller.'/ajax_html_data',$data); // this view loaded on ajax call
		}
		else
		{
			$data['pageName'] = 'admin/'.$this->controller.'/'.$this->controller.'_list';
			$this->load->view('admin/layout',$data);
		}
	}
/*
+-----------------------------------------+
	Function will save data, all parameters 
	will be in post method.
+-----------------------------------------+
*/
	function adminMenuForm()
	{
		if($this->cPrimaryId != '')
		{
			if($this->per_edit != 0)
			{
				setFlashMessage('error',getErrorMessageFromCode('01008'));
				showPermissionDenied();
			}
		}
		else if($this->per_add != 0)
		{
			setFlashMessage('error',getErrorMessageFromCode('01007'));
			showPermissionDenied();
		}
		$data = array();
		$this->form_validation->set_rules('am_name','Menu Name','trim|required');
		if(!$this->cPrimaryId)
		{
			$this->form_validation->set_rules('am_class_name','Class Key','trim|callback_checkClassKey');
		}
		$this->form_validation->set_rules('am_class_name','Class Name','trim|callback_checkClassname');
		$this->form_validation->set_rules('am_icon','Menu Icon','trim|required');
		
		
		if($this->input->get('edit') == 'true')
		{
			$dt =  array();
			if($this->cPrimaryId != '') // if primary id then we have to fetch those primary Id data
			{
				$dtArr = $this->am->getData();
				$dt = $dtArr->row_array();
			}
			$dt['pageName'] = 'admin/'.$this->controller.'/'.$this->controller.'_form';
			$this->load->view('admin/layout',$dt);
		}
		else
		{
			if($this->form_validation->run() == FALSE )
			{
				$data['error'] = $this->form_validation->get_errors();
				if($data['error'])
					setFlashMessage('error',getErrorMessageFromCode('01005'));
				
				$data['pageName'] = 'admin/'.$this->controller.'/'.$this->controller.'_form';
				$this->load->view('admin/layout',$data);
			}
			else // saving data to database
			{
				$this->am->cPrimaryId = $this->cPrimaryId; // setting variable to model
				
  			 	$this->am->saveData();
				redirect('admin/'.$this->controller);
			}
		}
	}
	
/*
+-----------------------------------------+
	Delete Category, single category and multiple
	category from single function call.
	@params : Item id. OR post array of ids
+-----------------------------------------+
*/		
	function deleteData()
	{	
		if($this->per_delete == 0)
		{
			$ids = $this->input->post('selected');
			$this->am->deleteData($ids);
		}
		else
			echo json_encode(array('type'=>'error','msg'=>getErrorMessageFromCode('01009')));
	}
/*
+-----------------------------------------+
	Update status for enabled/disabled
	@params : post array of ids,status
+-----------------------------------------+
*/	
	function updateStatus()
	{
		if($this->per_edit == 0)
			$this->am->updateStatus();
		else
			echo json_encode(array('type'=>'error','msg'=>getErrorMessageFromCode('01008')));	
	}

}