module.exports = function(){
    require('../../lib/qcumber')(this);

    this.When(/action requiring correct scope/, function(){
        return new Promise(function(resolve, reject){
            resolve();
        });
    });
};
