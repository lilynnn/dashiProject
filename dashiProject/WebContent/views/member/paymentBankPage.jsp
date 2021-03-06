<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  <style>
      div{
          border: 1px solid re
      }
      .title{
        background-color: rgb(223, 223, 223);
        font-size: 13px;
        font-weight: bolder;
        text-align: center;
        height: 30px;
        border-radius: 3px;
        margin-top: 25px;
        padding-top: 6px;
        

      }
      
      .payMethod-area{
        margin-top: 20px;
      }
      .contentOuter{
        border-color: rgb(79, 182, 134); 
        width: 420px; 
        height: 500px;
        margin: auto;

      }

      #payMent{
          width: 140px;
          height: 45px;
          border: none;
          background-color: rgb(207, 60, 60);
          color: white;
          font-weight:bolder;
          margin-top: 30px;
          margin-left: 70%;
          border-radius: 4px;
      }

      .bank-area , .receipt-area{
        margin-top: 15px;
        margin-bottom: 15px;
        border: 2px solid rgb(175, 175, 175);
        border-radius: 6px;
        padding: 20px;
      }
      #phone{
          width: 90%;
          height: 35px;
          font-size: 13px;
          margin-top:10px;
      }

      #accountNum{
        width: 250px;

      }
      .bank-area tr{
          height: 50px;
      }


  </style>
</head>
<body>


  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#payment">
    Open modal
  </button>

  <!-- The Modal -->
  <div class="modal fade" id="payment">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content" style="height: 800px;"><!--modal??? ???????????? ??????--->
      
        <!-- Modal Header -->
        <div class="modal-header">
            <div style="margin-left: 177px;">
                <h4 class="modal-title">?????? ??????</h4> 
            </div>
         
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="contentOuter">
            <div class="title">
                ??????????????? ??????????????????
            </div>

            <form action="">
                <!-- ?????? ?????????-->
                <div class="payMethod-area">
                    <input type="radio" name="payMethod" value="card">&nbsp;???????????? 
                                                                                                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="payMethod" value="bank">&nbsp;???????????????
                </div>


                <!-- ?????? ?????????--> 
                <div class="bank-area">
                    <table>
                        <tr>
                            <th>????????????</th>
                            <td>
                                <select name="" id="">
                                    <option value="">????????????</option>
                                    <option value="">????????????</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>??????????????????</th>
                            <td><input type="number"id="accountNum" required></td>
                        </tr>
                        <tr>
                            <th>????????????</th>
                            <td>2021/02/12</td>
                        </tr>
                    </table>
                </div>

                <!-- ???????????????--> 
                <div class="receipt-area" >
                    <table style="margin-bottom: 10px;">
                        <tr>
                            <td>
                                <p style="height: 9px;">???????????????</p>
                              
                                <input type="radio" name="receipt" value="deduction">&nbsp;??????????????? 
                                                                                                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="receipt" value="proof">&nbsp;???????????????
                                                                                                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="receipt" value="noreceipt">&nbsp;?????????

                                <input type="text" id="phone" name="phone" placeholder="??????????????? ??? ????????? ????????? ??????????????????. (-??????)" required>
                            </td>
                        </tr>
                    </table> 
                </div>
                <p style="font-size: 13px; text-align: center;">??? ????????? ?????????????????? <b style="color: rgb(34, 125, 211);">???????????? ????????????</b> ??? <b style="color: rgb(34, 125, 211);">????????????</b>??? ???????????????.</p>

                <hr>


                <h5 style="text-align: right;"><b>??? 50,000??? </b></h5>
            
                <button id="payMent">????????????</button>
           
            </form>
        </div>
    </div>
</div>

</body>
</html>