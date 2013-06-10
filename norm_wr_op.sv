//


class norm_wr_op extends OPERATION {

  constraint len_dist {
    op_len dist {1 := min_op_dist, 2:31 := btw_op_dist, 32 := max_op_dist};
  }
  
  
  task new() {
    min_op_dist = 40;
    max_op_dist = 40;
    btw_op_dist = 20;
  }//new


  /// can this be deleted if delcare range of associtive array with assoc_size ? ///
  /*
  task gen_payld() {
    int i;
    for (i = 0; i < op_len; i ++) {
      payld[i] = urandom();
    }
  }
  */


  task prt_op() {
    printf ("Time:%d op_len:%d", gtl, op_len);
  }
  
  
  //post_randomize is needed, if payld is defined as a associative array without range declaration
  /*
  task post_randomize() {
    gen_payld();
  }
  *?
  
  
  task gen_op() {
    int status;
    status = 2;     //// why assign 2 ? ////
    
    printf ("time:%d Write operation generated", gtl);
    status = this.randomize();
    if (status == 0)
      error ("randomize failed\n");
  }//gen_op


}//norm_wr_op
