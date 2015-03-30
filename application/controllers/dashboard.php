<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Dashboard extends CI_Controller {
	function __construct() {
		parent::__construct();
	}
	
	public function index() {
		$admin_valid			= $this->session->userdata('admin_valid');
		$admin_id				= $this->session->userdata('admin_id');
		$admin_level			= $this->session->userdata('admin_level');
		$admin_ta				= $this->session->userdata('admin_ta');
		$admin_id_unit			= $this->session->userdata('admin_id_unit');
		
		if ($admin_valid == FALSE || $admin_id == "") { redirect("dashboard/login"); } 	
		$a['menu']				= $this->db->query("SELECT id_menu FROM pengguna WHERE id = $admin_id")->row();
		
		$a['page']				= "d_amain";
		
		$this->load->view('aaa', $a);
	}
	
	
	public function status_kehadiran(){
		
		$data = array();
		
		$this->load->model('web_model');
		$id = $this->session->userdata('admin_id');
		
		if(!empty($_POST)){
			
			$this->form_validation->set_rules('kehadiran_status','Status Kehadiran','xss_clean');
			$this->form_validation->set_rules('kehadiran_keterangan','Keterangan','xss_clean');
			
			if($this->form_validation->run() == TRUE){
				$data['kehadiran_status'] = $this->input->post('kehadiran_status');
				$data['kehadiran_keterangan'] = $this->input->post('kehadiran_keterangan');
				
				$this->web_model->EDIT('id',$id,'pengguna',$data);
				$data['msg'] = 'Data berhasil diupdate';
			}else{
				$data['msg'] = validation_errors();
			}
			
		}
		
		$admin_valid			= $this->session->userdata('admin_valid');
		$admin_id				= $this->session->userdata('admin_id');
		$admin_level			= $this->session->userdata('admin_level');
		$admin_ta				= $this->session->userdata('admin_ta');
		$admin_id_unit			= $this->session->userdata('admin_id_unit');
		
		if ($admin_valid == FALSE || $admin_id == "") { redirect("dashboard/login"); } 	
		$data['menu']				= $this->db->query("SELECT id_menu FROM pengguna WHERE id = $admin_id")->row();
		
		$data['rs_kehadiran'] = $this->web_model->get_pengguna_by_id($id);
		$data['page'] = 'dashboard/f_status_kehadiran';
		$this->load->view('aaa', $data);
	}
	
	function upload_ttd(){
		$data = array();
		$this->load->model('web_model');
		$id = $this->session->userdata('admin_id');
		
		$admin_valid			= $this->session->userdata('admin_valid');
		$admin_id				= $this->session->userdata('admin_id');
		$admin_level			= $this->session->userdata('admin_level');
		$admin_ta				= $this->session->userdata('admin_ta');
		$admin_id_unit			= $this->session->userdata('admin_id_unit');
		
		if ($admin_valid == FALSE || $admin_id == "") { redirect("dashboard/login"); } 	
		
		if(!empty($_POST)){
			//exit(0);
			//$rs = $this->web_model->get_pengguna_by_id($id);
			
			$config_upload = array();
			$config_upload['upload_path'] = './ttd_img/';
			$config_upload['allowed_types'] = 'jpg';
			$config_upload['encrypt_name'] = TRUE;
			
			$this->load->library('upload', $config_upload);
			
			//upload file
			if (!$this->upload->do_upload('ttd_image')){
				$this->session->set_flashdata("k", "<div id=\"alert\" class=\"alert alert-error\">" . $this->upload->display_errors() . "</div>");
				
				$data['msg'] = $this->upload->display_errors();
			}else{
				$success = $this->upload->data();
				$data['ttd_image'] =  $success['file_name'];
				
				//file baru berhasil diupload, file lama hapus aja				
				//echo unlink('./ttd_img/' . $old_fullpaper_file);
				
				//$data['upload_at'] = date('Y-m-d H:i:s');
				
				/*
				function EDIT($q, $id, $tabel, $data) {
					$this->db->where($q, $id);
					$q = $this->db->update($tabel, $data);
					return $q;
				}	
				*/
				
				$this->web_model->EDIT('id',$id,'pengguna',$data);
				//$this->session->set_flashdata("k", "<div id=\"alert\" class=\"alert alert-error\">File berhasil diupload</div>");
				$data['msg'] = 'File Berhasil diupload';
			}
		}
		
		
		$data['menu']				= $this->db->query("SELECT id_menu FROM pengguna WHERE id = $admin_id")->row();
		
		$data['rs_pengguna'] = $this->web_model->get_pengguna_by_id($id);
		$data['page'] = 'dashboard/f_upload_ttd';
		$this->load->view('aaa', $data);
	}
	
	public function passwod() {
		$a['admin_id']			= $this->session->userdata('admin_id');
		$a['admin_id_unit']		= $this->session->userdata('admin_id_unit');
		$a['admin_user']	= $this->session->userdata('admin_user');
		$a['admin_nama']		= $this->session->userdata('admin_nama');
		$a['admin_ta']			= $this->session->userdata('admin_ta');
		$a['admin_level']		= $this->session->userdata('admin_level');
		$a['admin_apps']		= $this->session->userdata('admin_apps');
		$a['admin_valid']		= $this->session->userdata('admin_valid');
		$a['menu']				= $this->db->query("SELECT id_menu FROM pengguna WHERE id = ".$a['admin_id']."")->row();		
		if ($a['admin_valid'] == FALSE || $a['admin_id'] == "") { redirect("dashboard/login"); } 		
				
		$ke				= $this->uri->segment(3);			
		
		//var post
		$nama			= addslashes($this->input->post('nama'));	
		$p1				= md5($this->input->post('p1'));		
		$p2				= md5($this->input->post('p2'));	
		$p3				= md5($this->input->post('p3'));
		
		if ($ke == "simpan") { 	
			$cek_password_lama	= $this->db->query("SELECT password FROM pengguna WHERE id = ".$a['admin_id']."")->row();	
			if ($cek_password_lama->password != $p1) {
				$this->session->set_flashdata('k_passwod', '<div id="alert" class="alert alert-danger">Password Lama tidak sama</div>');
				redirect('dashboard/passwod');
			} else if ($p2 != $p3) {
				$this->session->set_flashdata('k_passwod', '<div id="alert" class="alert alert-danger">Password Baru 1 dan 2 tidak cocok</div>');
				redirect('dashboard/passwod');
			} else {
				$this->db->query("UPDATE pengguna SET nama = '$nama', password = '$p3' WHERE id = '".$a['admin_id']."'");
				$this->session->set_userdata('admin_nama', $nama);
				$this->session->set_flashdata('k_passwod', '<div id="alert" class="alert alert-success">Password berhasil diperbaharui</div>'); 
								
				$file		= "./capedeh/log_user/".md5($a['admin_user']).".log";	// alamat file log
				$browser 	= detect();											
				
				$isi		= "\r\n[".date('d-m-Y h:i:s')."] : UBAH PASSWORD Sukses. IP : ".$this->input->ip_address().", browser : ".$browser['name']." versi : ".$browser['version'].", OS : ".$browser['platform'].".";
				
				if (file_exists($file)) { 
					_tulis_f($isi, $file);
				} else {
					_buat_baru($a['admin_user'], $file);
				}
				/*end log file */
				
				redirect('dashboard/passwod');
			}
		} else {
			$a['data']	= $this->db->query("SELECT * FROM pengguna WHERE id = '".$a['admin_id']."'")->row();
			$a['page']	= "dashboard/f_passwod";	
		}
		
		$this->load->view('aaa', $a);	
	}

	public function log_akses() {
		$a['admin_id']			= $this->session->userdata('admin_id');
		$a['admin_id_unit']		= $this->session->userdata('admin_id_unit');
		$a['admin_user']	= $this->session->userdata('admin_user');
		$a['admin_nama']		= $this->session->userdata('admin_nama');
		$a['admin_ta']			= $this->session->userdata('admin_ta');
		$a['admin_level']		= $this->session->userdata('admin_level');
		$a['admin_apps']		= $this->session->userdata('admin_apps');
		$a['admin_valid']		= $this->session->userdata('admin_valid');
		$a['menu']				= $this->db->query("SELECT id_menu FROM pengguna WHERE id = ".$a['admin_id']."")->row();		
		if ($a['admin_valid'] == FALSE || $a['admin_id'] == "") { redirect("dashboard/login"); } 		
		
		$a['data_log']			= "";
		
		/* log file */
		$file					= "./capedeh/log_user/".md5($a['admin_user']).".log";
			
		$browser 	= detect();		
		if (file_exists($file)) {
			$file 					= fopen($file, "r");		
			while(! feof($file)) {		
				$a['data_log']		.= "<li>".fgets($file)."</li>";	
			}
			fclose($file);	
		} else {
			_buat_baru($a['admin_user'], $file);
		}
		/* End log file */
			
		$a['page']	= "dashboard/f_log_akses";		// lihat di atas
		
		$this->load->view('aaa', $a);	// lihat di atas
	}
	
	public function login() {
		/*$this->load->helper('captcha'); 
        $vals = array(
			'img_path'	 => './capedeh/',
			'img_url'	 => base_url().'capedeh/',
			'font_path'	 => './aset/fonts/verdanab.ttf',
			'img_width'	 => '100',
			'img_height' => 45,
			'border' => 0, 
			'expiration' => 7200
		);
		
        $cap 					= create_captcha($vals);
		$data['img_kaptcha'] 	= $cap['image'];
        $this->session->set_userdata('capedeh', $cap['word']);
		*/
		
 		$this->load->view('dashboard/login');
	}
	
	public function do_login() {
		$u 			= $this->security->xss_clean($this->input->post('u'));
		$p 			= md5($this->security->xss_clean($this->input->post('p')));
        $ta 		= $this->security->xss_clean($this->input->post('ta'));
        		
		$q_cek		= $this->db->query("SELECT * FROM pengguna WHERE username = '".$u."' AND password = '".$p."' AND status = 'Y'");
		$j_cek		= $q_cek->num_rows();
		$d_cek		= $q_cek->row();
		
        if($j_cek == 1 ) {
            $data = array(
                    'admin_id' 		=> $d_cek->id,
                    'admin_id_unit'	=> $d_cek->id_unit,
                    'admin_user' 	=> $d_cek->username,
                    'admin_nama' 	=> $d_cek->nama,
                    'admin_ta' 		=> $ta,
                    'admin_level'	=> $d_cek->level,
                    'admin_apps'	=> $d_cek->apps,
                    'admin_valid' 	=> true
                    );
            $this->session->set_userdata($data);
            /* log file */
			$admin_user	= $this->session->userdata('admin_user');
			$file		= "./capedeh/log_user/".md5($admin_user).".log";
			$browser 	= detect();
		
			$isi		= "\r\n[".date('d-m-Y h:i:s')."] : LOG IN Sukses. IP : ".$this->input->ip_address().", browser : ".$browser['name']." versi : ".$browser['version'].", OS : ".$browser['platform'].".";
			
			if (file_exists($file)) { 
				_tulis_f($isi, $file);
			} else {
				$file_baru	= fopen($file,"w");
				fputs($file_baru,"Log akses $admin_user (".date('d-m-Y h:i:s')."). IP : ".$this->input->ip_address().", browser : ".$browser['name']." versi : ".$browser['version'].", OS : ".$browser['platform']."\r\n====================\r\n");
				fclose($file_baru);
			}
			/*end log file */
			redirect('dashboard');
        } else {	
			$this->session->set_flashdata("k", "<div id=\"alert\" class=\"alert alert-danger\">Username atau password salah</div>");
			redirect('dashboard/login');
		}
	}
		
	public function logout(){
		/* log file */
		$admin_user	= $this->session->userdata('admin_user');
		$file		= "./capedeh/log_user/".md5($admin_user).".log";
		$browser 	= detect();
		
		$isi		= "\r\n[".date('d-m-Y h:i:s')."] : LOG OUT Sukses. IP : ".$this->input->ip_address().", browser : ".$browser['name']." versi : ".$browser['version'].", OS : ".$browser['platform'].".";
		
		if (file_exists($file)) { 
			_tulis_f($isi, $file);
        } else {
			$file_baru	= fopen($file,"w");
			fputs($file_baru,"Log akses $admin_user (".date('d-m-Y h:i:s')."). IP : ".$this->input->ip_address().", browser : ".$browser['name']." versi : ".$browser['version'].", OS : ".$browser['platform']."\r\n====================\r\n");
			fclose($file_baru);
		}
		/* end log file */
		$this->session->sess_destroy();
		redirect('dashboard/login');
    }

}