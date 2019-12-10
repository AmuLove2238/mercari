// $(function(){ 
//   $("#category__frame").on("change",function(e){
//     e.preventDefault();
//     var formData = new FormData(this);
//     var url = $(this).attr("action");
//     debugger;
//     // console.log(this);
//     // 親ボックスのidを取得してそのidをAjax通信でコントローラーへ送る
//   //   var categoryValue = document.getElementById("category__frame").value;
//   // 　　//　("parent-form")は親ボックスのid属性
//   //   if (productcategory != ''){
//     // console.log("aaa");
//       $.ajax({
//         url: '/items/new',
//         type: "GET",
//         data: {
//           // category_id: categoryValue // 親ボックスの値をparent_idという変数にする。
//         },
//         dataType: 'json'
//     　　　　//json形式を指定 
//   //     })
//   //     .done(function(category) {
//   //       console.log(category);
//   //     })
//     // }
//   })
// })；