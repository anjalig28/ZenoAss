<?php

namespace App\Controllers\api;

use CodeIgniter\RESTful\ResourceController;
use App\Models\DrugModel;

class Drug extends ResourceController
{
    public function __construct(){
        $this->model = new DrugModel();
    }
    /**
     * Return an array of resource objects, themselves in array format
     *
     * @return mixed
     */
    //http://localhost:8080/api/drug/ - get
    public function index()
    {
        return $this->respond(['users' => $this->model->findAll()], 200);
    }

    //http://localhost:8080/api/list/3
    public function list($page)
    {
        $item_per_page = 3;
        $offset = (($page - 1) * $item_per_page) + 1;
        $offset = ($offset==0) ? 1 : $offset;
        return $this->respond(['users' => $this->model->findAll(3, $offset)]);
    }

    /**
     * Return the properties of a resource object
     *
     * @return mixed
     */
    //http://localhost:8080/api/drug/id - get
    public function show($id = null) 
    {
        return $this->respond(['users' => $this->model->find($id)]);
    }

    /**
     * Create a new resource object, from "posted" parameters
     *
     * @return mixed
     */
    //http://localhost:8080/login - post
    public function create()
    {
        $rules = [
            'drug_name'         => ['label' => 'Drug Name', 'rules' => 'required|min_length[5]|max_length[255]|is_unique[drug.drug_name]'],
            'mrp'               => ['label' => 'MRP', 'rules' => 'required|decimal'],
            'retailer_price'    => ['label' => 'Retailer Price', 'rules' => 'required|decimal'],
            'expiry_date'       => ['label' => 'Expiry Date', 'rules' => 'required'],
            'barcode'           => ['label' => 'Barcode', 'rules' => 'required'],
            'type'              => ['label' => 'Type', 'rules' => 'required'],
        ];
            
  
        if($this->validate($rules)){
            $data = [
                'drug_name'         => $this->request->getVar('drug_name'),
                'mrp'               => $this->request->getVar('mrp'),
                'retailer_price'    => $this->request->getVar('retailer_price'),
                'expiry_date'       => date('Y-m', strtotime($this->request->getVar('expiry_date'))),
                'barcode'           => $this->request->getVar('barcode'),
                'type'              => $this->request->getVar('type'),
            ];
            $this->model->save($data);
             
            return $this->respond(['message' => 'Drug data saved Successfully'], 200);
        }else{
            $response = [
                'errors' => $this->validator->getErrors(),
                'message' => 'Invalid Inputs'
            ];
            return $this->fail($response , 409);
             
        }
    }

    /**
     * Add or update a model resource, from "posted" properties
     *
     * @return mixed
     */
    //http://localhost:8080/api/drug/1 - put
    public function update($id = null)
    {
        $data = [
            'drug_name'         => $this->request->getVar('drug_name'),
            'mrp'               => $this->request->getVar('mrp'),
            'retailer_price'    => $this->request->getVar('retailer_price'),
            'expiry_date'       => $this->request->getVar('expiry_date'),
            'barcode'           => $this->request->getVar('barcode'),
            'type'              => $this->request->getVar('type')
        ];
        $this->model->update($id, $data);
        
        return $this->respond(['message' => 'Drug data updated Successfully'], 200);
    }

    /**
     * Delete the designated resource object from the model
     *
     * @return mixed
     */
    //http://localhost:8080/api/drug/1 - delete
    public function delete($id = null)
    {
        $data = $this->model->where('id', $id)->delete($id);
        if($data){
            $this->model->delete($id);
            return $this->respond(['message' => 'Drug data deleted Successfully'], 200);
        }else{
            return $this->failNotFound('No drug found');
        }
    }

   
}
