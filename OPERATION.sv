//

virtual class OPERATION {

  rand  bit[5:0]  op_len;     //duration of one operation
  rand  bit[7:0]  payld[];    //data used to write into fifo
  
  virtual task gen_payld();

  virtual task gen_op();

  virtual task prt_op();

}//OPERATION
