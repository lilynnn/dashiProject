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
      <div class="modal-content" style="height: 800px;"><!--modal창 세로크기 조절--->
      
        <!-- Modal Header -->
        <div class="modal-header">
            <div style="margin-left: 177px;">
                <h4 class="modal-title">결제 정보</h4> 
            </div>
         
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="contentOuter">
            <div class="title">
                결제수단을 선택해주세요
            </div>

            <form action="">
                <!-- 결제 방식란-->
                <div class="payMethod-area">
                    <input type="radio" name="payMethod" value="card">&nbsp;신용카드 
                                                                                                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="payMethod" value="bank">&nbsp;무통장입금
                </div>


                <!-- 결제 방식란--> 
                <div class="bank-area">
                    <table>
                        <tr>
                            <th>은행선택</th>
                            <td>
                                <select name="" id="">
                                    <option value="">신한은행</option>
                                    <option value="">우리은행</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>가상계좌번호</th>
                            <td><input type="number"id="accountNum" required></td>
                        </tr>
                        <tr>
                            <th>입금기한</th>
                            <td>2021/02/12</td>
                        </tr>
                    </table>
                </div>

                <!-- 현금영수증--> 
                <div class="receipt-area" >
                    <table style="margin-bottom: 10px;">
                        <tr>
                            <td>
                                <p style="height: 9px;">현금영수증</p>
                              
                                <input type="radio" name="receipt" value="deduction">&nbsp;소득공제용 
                                                                                                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="receipt" value="proof">&nbsp;지출증빙용
                                                                                                                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="radio" name="receipt" value="noreceipt">&nbsp;미발행

                                <input type="text" id="phone" name="phone" placeholder="휴대폰번호 및 사업자 번호를 작성해주세요. (-제외)" required>
                            </td>
                        </tr>
                    </table> 
                </div>
                <p style="font-size: 13px; text-align: center;">이 결제를 진행함으로써 <b style="color: rgb(34, 125, 211);">개인정보 처리방침</b> 및 <b style="color: rgb(34, 125, 211);">이용약관</b>에 동의합니다.</p>

                <hr>


                <h5 style="text-align: right;"><b>총 50,000원 </b></h5>
            
                <button id="payMent">결제하기</button>
           
            </form>
        </div>
    </div>
</div>

</body>
</html>