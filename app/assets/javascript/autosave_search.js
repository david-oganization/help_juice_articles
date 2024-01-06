document.addEventListener('DOMContentLoaded', function() {
  var inputTimer;                
  var inputProcessingInterval = 200;
  var inputField = document.getElementById('search_term');

  refreshTrendingSearches();
  inputField.addEventListener('input', function() {
    refreshTrendingSearches();
    clearTimeout(inputTimer);
    inputTimer = setTimeout(performSearch, inputProcessingInterval);
  });

  function performSearch() {
    var searchTerm = inputField.value;
    var xhr = new XMLHttpRequest();
    xhr.open('POST', '/searches', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    xhr.onreadystatechange = function() {
      refreshTrendingSearches();
    };
    xhr.send('search_term=' + encodeURIComponent(searchTerm));
  }

  function refreshTrendingSearches() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/analytics', true);
    xhr.onreadystatechange = function() {
      if (xhr.readyState == XMLHttpRequest.DONE) {
        if (xhr.status == 200) {
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
