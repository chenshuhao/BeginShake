<?php
    namespace App\Models;

    class Card extends \Phalcon\Mvc\Model{

        
        public function saveData($data){
            $data['merchant_id'] =1;
            return $this->save($data);
        }
        public function cardList(){
            return $this->find(array('merchant_id'=>1));
        }
        public function deleteCard($id){
            if($this->findFirst($id)){
               return $this->findFirst($id)->delete();
            }
        }
        public function findCard($id){
            return $this->findFirst(array("id=$id"));
        }
    }