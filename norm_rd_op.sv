//


class norm_rd_op extends OPERATION {

  constraint len_dist {
    op_len dist {1 := min_op_dist, 2:31 := btw_op_dist, 32 := max_op_dist};
  }
  
  
  task new() {
    min_op_dist = 40;
    max_op_dist = 40;
    btw_op_dist = 20;
  }//new


  task prt_op() {
    printf ("Time:%d op_len:%d", gtl, op_len);
  }
  
  
  
  task gen_op() {
    int status;
    status = 2;     //// why assign 2 ? ////
    
    printf ("time:%d Write operation generated", gtl);
    status = this.randomize();
    if (status == 0)
      error ("randomize failed\n");
  }//gen_op


}//norm_rd_op
