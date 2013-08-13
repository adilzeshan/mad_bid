!function(){var t=function(t,n){return function(){return t.apply(n,arguments)}};this.WebSocketRails=function(){function n(s,e){this.url=s,this.use_websockets=null!=e?e:!0,this.connection_stale=t(this.connection_stale,this),this.pong=t(this.pong,this),this.supports_websockets=t(this.supports_websockets,this),this.dispatch_channel=t(this.dispatch_channel,this),this.unsubscribe=t(this.unsubscribe,this),this.subscribe_private=t(this.subscribe_private,this),this.subscribe=t(this.subscribe,this),this.dispatch=t(this.dispatch,this),this.trigger_event=t(this.trigger_event,this),this.trigger=t(this.trigger,this),this.bind=t(this.bind,this),this.connection_established=t(this.connection_established,this),this.new_message=t(this.new_message,this),this.state="connecting",this.callbacks={},this.channels={},this.queue={},this._conn=this.supports_websockets()&&this.use_websockets?new n.WebSocketConnection(s,this):new n.HttpConnection(s,this),this._conn.new_message=this.new_message}return n.prototype.new_message=function(t){var s,e,i,h,c,o;for(o=[],i=0,h=t.length;h>i;i++)e=t[i],s=new n.Event(e),s.is_result()?(null!=(c=this.queue[s.id])&&c.run_callbacks(s.success,s.data),this.queue[s.id]=null):s.is_channel()?this.dispatch_channel(s):s.is_ping()?this.pong():this.dispatch(s),"connecting"===this.state&&"client_connected"===s.name?o.push(this.connection_established(s.data)):o.push(void 0);return o},n.prototype.connection_established=function(t){return this.state="connected",this.connection_id=t.connection_id,this._conn.flush_queue(t.connection_id),null!=this.on_open?this.on_open(t):void 0},n.prototype.bind=function(t,n){var s;return null==(s=this.callbacks)[t]&&(s[t]=[]),this.callbacks[t].push(n)},n.prototype.trigger=function(t,s,e,i){var h;return h=new n.Event([t,s,this.connection_id],e,i),this.queue[h.id]=h,this._conn.trigger(h)},n.prototype.trigger_event=function(t){var n,s;return null==(n=this.queue)[s=t.id]&&(n[s]=t),this._conn.trigger(t)},n.prototype.dispatch=function(t){var n,s,e,i,h;if(null!=this.callbacks[t.name]){for(i=this.callbacks[t.name],h=[],s=0,e=i.length;e>s;s++)n=i[s],h.push(n(t.data));return h}},n.prototype.subscribe=function(t){var s;return null==this.channels[t]?(s=new n.Channel(t,this),this.channels[t]=s,s):this.channels[t]},n.prototype.subscribe_private=function(t){var s;return null==this.channels[t]?(s=new n.Channel(t,this,!0),this.channels[t]=s,s):this.channels[t]},n.prototype.unsubscribe=function(t){return null!=this.channels[t]?(this.channels[t].destroy(),delete this.channels[t]):void 0},n.prototype.dispatch_channel=function(t){return null!=this.channels[t.channel]?this.channels[t.channel].dispatch(t.name,t.data):void 0},n.prototype.supports_websockets=function(){return"function"==typeof WebSocket||"object"==typeof WebSocket},n.prototype.pong=function(){var t;return t=new n.Event(["websocket_rails.pong",{},this.connection_id]),this._conn.trigger(t)},n.prototype.connection_stale=function(){return"connected"!==this.state},n}()}.call(this);