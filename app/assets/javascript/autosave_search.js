document.addEventListener('DOMContentLoaded', function() {
  var inputTimer;                
  var inputProcessingInterval = 100;
  var inputField = document.getElementById('search_term');

  console.log('Autosave search enabled');

  inputField.addEventListener('input', function() {
    clearTimeout(inputTimer);
    inputTimer = setTimeout(performSearch, inputProcessingInterval);
    refreshTrendingSearches();
  });

  function performSearch() {
    var searchTerm = inputField.value;
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/searches', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
      if (xhr.readyState == XMLHhttpRequest.DONE) {
        if (xhr.status == 200) {
          console.log('Search Saved Successfully:', xhr.responseText);
        } else {
          console.error('Error saving search:', xhr.status);
        }
      }
    };
    xhr.send('search_term=' + encodeURIComponent(searchTerm));
  }

  function refreshTrendingSearches() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/analytics', true);
    xhr.onreadystatechange = function() {
      if (xhr.readyState == XMLHttpRequest.DONE) {
        if (xhr.status == 200) {
          console.log('Trending Searches:', xhr.response)
          // var trendingSearches = JSON.parse(xhr.responseText);
          trendingSearches = xhr.response
          var trendingSearchesList = document.getElementById('trending_searches');
          trendingSearchesList.innerHTML = trendingSearches;
        } else {
          console.error('Error refreshing trending searches:', xhr.status);
        }
      }
    };
    xhr.send();
  }
});
