! function (e) {
    function t(r) {
        if (o[r]) return o[r].exports;
        var i = o[r] = {
            exports: {},
            id: r,
            loaded: !1
        };
        return e[r].call(i.exports, i, i.exports, t), i.loaded = !0, i.exports
    }
    var o = {};
    return t.m = e, t.c = o, t.p = "", t(0)
}([function (e, t, o) {
    "use strict";

    function r(e) {
        return e && e.__esModule ? e : {
            default: e
        }
    }
    var i = o(1),
        n = r(i);
    void 0 === window.cryptowatch && (window.cryptowatch = {}), window.cryptowatch.Embed = n.default
}, function (e, t) {
    "use strict";

    function o(e, t) {
        if (!(e instanceof t)) throw new TypeError("Cannot call a class as a function")
    }

    function r(e) {
        var t = [];
        for (var o in e) t.push(o + "=" + e[o]);
        return 0 === t.length ? "" : "?" + t.join("&")
    }
    Object.defineProperty(t, "__esModule", {
        value: !0
    });
    var i = function () {
            function e(e, t) {
                for (var o = 0; o < t.length; o++) {
                    var r = t[o];
                    r.enumerable = r.enumerable || !1, r.configurable = !0, "value" in r && (r.writable = !0), Object.defineProperty(e, r.key, r)
                }
            }
            return function (t, o, r) {
                return o && e(t.prototype, o), r && e(t, r), t
            }
        }(),
        n = ["1m", "3m", "5m", "15m", "30m", "1h", "2h", "4h", "6h", "12h", "1d", "3d", "1w"],
        s = ["en", "es", "zh-CN", "de", "ja-JP", "el-GR", "da-DK"],
        c = function () {
            function e(t, r) {
                var i = arguments.length > 2 && void 0 !== arguments[2] ? arguments[2] : {};
                if (o(this, e), this.exchange = t, this.currencyPair = r, this.opts = i, void 0 === t) throw new Error("exchange required");
                if (void 0 === r) throw new Error("currencyPair required");
                if (void 0 !== i.timePeriod && "string" == typeof i.timePeriod) {
                    if (i.timePeriod = i.timePeriod.toLowerCase(), n.indexOf(i.timePeriod) === -1) throw new Error('Unknown time period "' + i.timePeriod + '"\nValid timePeriods: ' + n.join(", "));
                    i.timePeriod = i.timePeriod.toLowerCase()
                } else i.timePeriod = null;
                if (void 0 !== i.locale && s.indexOf(i.locale) === -1) throw new Error('Unknown locale "' + i.locale + '"\nValid locales: ' + s.join(", "));
                void 0 === i.host && (i.host = "embed.cryptowat.ch"), void 0 === i.protocol && (i.protocol = "https"), void 0 === i.width && (i.width = "100%"), void 0 === i.height && (i.height = "100%")
            }
            return i(e, [{
                key: "createIframe",
                value: function () {
                    var e = document.createElement("iframe");
                    return e.setAttribute("src", this.src), e.setAttribute("frameborder", 1), e.setAttribute("allowfullscreen", !0), e.setAttribute("width", this.opts.width), e.setAttribute("height", this.opts.height), e
                }
            }, {
                key: "mount",
                value: function (e) {
                    "string" == typeof e && (e = document.querySelector(e)), e.appendChild(this.createIframe())
                }
            }, {
                key: "src",
                get: function () {
                    var e = "/" + this.exchange + "/" + this.currencyPair;
                    null !== this.opts.timePeriod && (e += "/" + this.opts.timePeriod);
                    var t = this.opts.protocol + "://" + this.opts.host + e,
                        o = {};
                    if (this.opts.locale && (o.locale = this.opts.locale), this.opts.query)
                        for (var i in this.opts.query) void 0 === o[i] && (o[i] = this.opts.query[i]);
                    return void 0 !== this.opts.presetColorScheme ? o.presetColorScheme = this.opts.presetColorScheme : void 0 !== this.opts.customColorScheme && (o.customColorScheme = encodeURIComponent(JSON.stringify(this.opts.customColorScheme))), t += r(o)
                }
            }]), e
        }();
    t.default = c, e.exports = t.default
}]);
