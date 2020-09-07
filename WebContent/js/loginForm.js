const fields = document.querySelectorAll(".textb input");
const btn = document.querySelector(".btn");

function check(){
    /* Username과 Password 부분 input 태그의 value값이 공백이 아니면 */
    if(fields[0].value != "" && fields[1].value != ""){
        /* 클래스네임 btn 태그에 disabled는 false로 실행되지 않는다. */
        btn.disabled = false;
    }else{
        /* 클래스네임 btn 태그에 disabled는 true로 실행된다. */
        btn.disabled = true;
    }
}


fields[0].addEventListener("keyup", check);
console.log('fields[0]' + fields[0]);
fields[1].addEventListener("keyup", check);
console.log('fields[1]' + fields[1]);

window.onload = function(){
    document.querySelector('.show-password').addEventListener('click', function(){
        /* class show-password, fas, fa-arrow-right라서 [2] 인가? */
        console.log('>>>>>>>>>>>>>>>>>');
        if(this.classList[2] == "fa-eye-slash"){
            console.log('1111111111');
            this.classList.remove("fa-eye-slash");
            this.classList.add("fa-eye");
            fields[1].type = "text";
        }else{
            this.classList.remove("fa-eye");
            this.classList.add("fa-eye-slash");
            fields[1].type = "password";
        }
    });
}
