module.exports = function(){
    require('../../lib/qcumber')(this);

    this.World = require('../support/world').World;

    this.When(/action requiring correct scope/, function(){
        return this.doSomeAction();
    });
};
