!function(){var t=function(t,i){return function(){return t.apply(i,arguments)}};WebSocketRails.Event=function(){function i(i,s,n){var e;this.success_callback=s,this.failure_callback=n,this.run_callbacks=t(this.run_callbacks,this),this.attributes=t(this.attributes,this),this.serialize=t(this.serialize,this),this.is_ping=t(this.is_ping,this),this.is_result=t(this.is_result,this),this.is_channel=t(this.is_channel,this),this.name=i[0],e=i[1],null!=e&&(this.id=null!=e.id?e.id:0|65536*(1+Math.random()),this.channel=null!=e.channel?e.channel:void 0,this.data=null!=e.data?e.data:e,this.connection_id=i[2],null!=e.success&&(this.result=!0,this.success=e.success))}return i.prototype.is_channel=function(){return null!=this.channel},i.prototype.is_result=function(){return this.result===!0},i.prototype.is_ping=function(){return"websocket_rails.ping"===this.name},i.prototype.serialize=function(){return JSON.stringify([this.name,this.attributes()])},i.prototype.attributes=function(){return{id:this.id,channel:this.channel,data:this.data}},i.prototype.run_callbacks=function(t,i){return t===!0?"function"==typeof this.success_callback?this.success_callback(i):void 0:"function"==typeof this.failure_callback?this.failure_callback(i):void 0},i}()}.call(this);