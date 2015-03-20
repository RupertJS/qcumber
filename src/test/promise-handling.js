var sinon = require('sinon'),
    Q = require('q');

require('should');

describe('promise handling', function() {
    var $ = {},
        steps;

    beforeEach(function () {
        $.callback = sinon.spy();
    });

    function callDefinition(definition) {
        return new Q.Promise(function (resolve) {
            var done = function (err) {
                $.callback(err);
                resolve(err);
            };

            done.fail = function (err) {
                $.callback(err);
                resolve(err);
            };

            definition(done);
        });
    }

    beforeEach(function () {
        // Pretend to be cucumberjs
        steps = {
            definitions: [],

            flush: function () {
                var calls = this.definitions.map(function (def) {
                    return callDefinition(def);
                });

                return Q.all(calls);
            },

            defineStep: function (regex, definition) {
                this.definitions.push(definition);
            }
        };

        require('../lib/qcumber')(steps);
    });

    it('call done without params when promise resolved', function (done) {
        steps.Then('just a test step', function () {
            return Q.Promise(function (resolve, reject) {
                resolve();
            });
        });

        steps.flush()
            .then(function () {
                $.callback.calledOnce.should.be.true;
                $.callback.calledWith().should.be.true;

                done();
            })
            .catch(done);
    });

    it('call done with error when promise rejected', function (done) {
        steps.Then('just a test step', function () {
            return new Q.Promise(function (resolve, reject) {
                reject('Something went wrong');
            });
        });

        steps.flush()
            .then(function () {
                $.callback.calledOnce.should.be.true;
                $.callback.calledWith('Something went wrong').should.be.true;

                done();
            })
            .catch(done);
    });
});
