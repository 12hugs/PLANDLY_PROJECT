window.onload = function() {
  var heartButtons = document.querySelectorAll(".heartBtn");
  heartButtons.forEach(function(button) {
    var count = 0;
    button.addEventListener("click", function() {
      var icon = this.querySelector('i');
      icon.style.color = 'red';
      this.innerHTML = '<i class="xi-heart xi-2x" style="color:red;"></i>';
      countPlus(this, count);
    });
    
    function countPlus(button, count) {
      count++;
      button.nextElementSibling.innerHTML = "좋아요 " + count + "개";
    }
  });

  var bookmarkIcons = document.querySelectorAll(".bookmark i");
  bookmarkIcons.forEach(function(icon) {
    toggleBookmarkColor(icon);
  });

};

function toggleBookmarkColor(icon) {
  icon.addEventListener('click', function() {
    if (this.style.color === 'rgb(244, 222, 113)') {
      this.style.color = 'rgb(171, 177, 182)';
    } else {
      this.style.color = 'rgb(244, 222, 113)';
    }
  });
}

// 다양한 변수 선언
var postReviewBtn = document.querySelector(".review_upload");
var addReviewInput = document.querySelector('.input_review');
var newReviewComment= document.querySelector('.comment');
var commenterList= ['uuu', 'pdds', 'hooe', 'ddwwe'];