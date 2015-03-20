var Q = require('q');

exports.World = function (callback) {
    this.doSomeAction = function () {
        return new Q.Promise(function(resolve, reject){
            resolve();
        });
    };

    callback();
};
