function checkAddProduct(){
	     let productId = document.getElementById("productId");
	     let pname = document.getElementById("pname");
	     let unitPrice = document.getElementById("unitPrice");
	     let unitsInStock = document.getElementById("unitsInStock");
	     
	
	     //상품 아이디 체크
	     if(!check(/^P[0-9]{4,11}$/, productId, "[상품 코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요")){
	        return false;
	     }
	
	     //상품명 체크
	     if(pname.value.length < 4 || pname.value.length > 12){
	          alert("[상품명]\n최소 4자에서 최대 12자까지 입력하세요");
	          pname.select();
	          pname.focus();
	          return false;
	     }
	
	     //상품 가격 체크
	     if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
	          alert("[가격]\n숫자만 입력하세요");
	          unitPrice.select();
	          unitPrice.focus();
	          return false;
	     }
	     if(unitPrice.value < 0){
	          alert("[가격]\n음수는 입력할 수 없습니다.");
	          unitPrice.select();
	          unitPrice.focus();
	          return false;
	     }
	
	     //재고 수 체크
	     if(unitsInStock.value.length == 0 || isNaN(unitsInStock.value)){
	          alert("[재고 수]\n숫자만 입력하세요");
	          unitsInStock.select();
	          unitsInStock.focus();
	          return false;
	     }
	
	     //check() 함수
	
	     function check(regExp, e, msg){
	          if(regExp.test(e.value)){
	               return true;
	          }else{
	        	   alert(msg);
			       e.select();
			       e.focus();
			       return false;
	          }
	         
	     }
	     document.newProduct.submit();
	}