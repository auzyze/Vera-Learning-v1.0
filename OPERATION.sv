//

virtual class OPERATION {

  rand  bit[5:0]  op_len;     //duration of one operation
        
  rand  bit[7:0]  payld[] assoc_size op_len;    //"assoc_size"
        
        //note: If associtive arrays are randomized, only the elements specified in the
        //      range declared by assoc_size are randomized
  
  
  protected int min_op_dist;
  protected int max_op_dist;
  protected int btw_op_dist;
  
  
  virtual task gen_payld();

  virtual task gen_op();

  virtual task prt_op();
  
  virtual task set_limit();

}//OPERATION
