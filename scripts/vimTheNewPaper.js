var spawn = require('child_process').spawn;

hexo.on('new', function(data){
    spawn('vim', [data.path], { stdio: 'inherit' });
});
