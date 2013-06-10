//

class gen_stim  {
    
    OPERATION op;       //virtual base class for fifo operation
    
    norm_wr_op  wr_op;  //extended from OPERATION, used to gen write operation
    
    norm_rd_op  rd_op;  //extended from OPERATION, used to gen read opeartion
    
    stim_gen_mode;      //write or read mode selection
    
    int gen_count;   //used to count operations

    
    
    task  new (int op_mbx, bit gen_mode, int gen_cnt){
      gen_count = gen_cnt;
          
      get_user_args ();
      
      stim_gen_mode = gen_mode;
      
      while (1) {
        gen_operation (op_mbx);
        @ (posedge CLOCK);      //// where is CLOCK from?? ////
      }
    
    }//new
    
    
    task  get_user_args () {
      int op_cnt;
      
      if (get_plus_arg (CHECK, "op_cnt=")){
        op_cnt = get_plus_arg (NUM, "op_cnt=");
        set_wr_count (op_cnt);
      }
    }//get_user_args


    task set_op_count (int cnt){
      gen_count = cnt;
    }
      
    
    task gen_operation (int xctmbx){
      OPERATION op;   //virtual class, can not by constructed
      
        while (gen_count > 0){
          if (stim_gen_mode == WRITE){
            norm_wr_op = new;
            op = norm_wr_op;
          }  
          else if (stim_gen_mode == READ){
            norm_rd_op = new;
            op = norm_rd_op;    //assignment to virtual base class
          }
          
          op.gen_op();    //"gen_op" is a virtual method in OPERATION, overrided in extended classes
          op.prt_op;
          mailbox_put(xctmbx, op);    //put one operation generated into mailbox
          
          gen_count --;
        }
    }//gen_operation
    
}//stim_gen
    
