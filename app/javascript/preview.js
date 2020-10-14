document.addEventListener('DOMContentLoaded', function(){
  const ImageList = document.getElementById('image-list');
  document.getElementById('prototype_image').addEventListener('change', function(e){
    const file = e.target.files[0];
    console.log(e)
    const image = window.URL.createObjectURL(file)

    const blobImage = document.createElement('img');
    blobImage.setAttribute('src', image);

    ImageList.appendChild(blobImage);
  });
});