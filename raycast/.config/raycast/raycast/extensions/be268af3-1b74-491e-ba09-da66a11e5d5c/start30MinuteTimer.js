"use strict";var d=Object.defineProperty;var N=Object.getOwnPropertyDescriptor;var D=Object.getOwnPropertyNames;var $=Object.prototype.hasOwnProperty;var E=(e,t)=>{for(var r in t)d(e,r,{get:t[r],enumerable:!0})},b=(e,t,r,i)=>{if(t&&typeof t=="object"||typeof t=="function")for(let a of D(t))!$.call(e,a)&&a!==r&&d(e,a,{get:()=>t[a],enumerable:!(i=N(t,a))||i.enumerable});return e};var C=e=>b(d({},"__esModule",{value:!0}),e);var B={};E(B,{default:()=>F});module.exports=C(B);var P=require("@raycast/api");var s=require("@raycast/api"),y=require("child_process");var o=require("fs");var S=e=>{let t=Math.floor(e/3600),r=String(Math.floor(e%3600/60)).padStart(2,"0"),i=String(Math.floor(e%60)).padStart(2,"0");return`${t===0?"":t+":"}${r}:${i}`};var n=require("@raycast/api"),f=require("fs");var p=e=>{let t=(0,n.getPreferenceValues)();if(e.launchedFromMenuBar||t.closeWindowOnTimerStart){let r=e.isErr?"\u26A0\uFE0F":"\u{1F389}";return(0,n.showHUD)(`${r} ${e.msg}`),(0,n.popToRoot)()}else(0,n.showToast)({style:e.isErr?n.Toast.Style.Failure:n.Toast.Style.Success,title:e.msg})},T=async()=>{let e=n.environment.supportPath+"/ringContinuouslyWarningShown";if(!(0,n.getPreferenceValues)().ringContinuously||(0,f.existsSync)(e))return!0;let r=await(0,n.confirmAlert)({title:"Ring Continuously is enabled!",icon:n.Icon.Bell,message:'When the timer rings, you will need to use the "Stop Running Timer" command or stop the timer in the "Manage Timers" command to dismiss the sound. You can configure this in your Raycast settings.'});return r&&(0,f.writeFileSync)(e,""),r};var x=s.environment.supportPath+"/customTimers.json",V=s.environment.supportPath+"/defaultPresetVisibles.json";var w=(e=!1)=>{let t=(0,s.getPreferenceValues)();return parseFloat(t.volumeSetting)>5?(p({msg:"Timer alert volume should not be louder than 5 (it can get quite loud!)",launchedFromMenuBar:e,isErr:!0}),!1):!0};async function M({timeInSeconds:e,timerName:t="Untitled",launchedFromMenuBar:r=!1,selectedSound:i="default"}){if(!await T())return;let c=(s.environment.supportPath+"/"+new Date().toISOString()+"---"+e+".timer").replace(/:/g,"__");(0,o.writeFileSync)(c,t);let l=(0,s.getPreferenceValues)(),O=`${s.environment.assetsPath+"/"+(i==="default"?l.selectedSound:i)}`,u=[`sleep ${e}`];u.push(`if [ -f "${c}" ]; then osascript -e 'display notification "Timer \\"${t}\\" complete" with title "Ding!"'`);let g=l.selectedSound==="speak_timer_name"?`say ${t}`:`afplay "${O}" --volume ${l.volumeSetting.replace(",",".")}`;if(u.push(g),l.ringContinuously){let m=`${c}`.replace(".timer",".dismiss");(0,o.writeFileSync)(m,".dismiss file for Timers"),u.push(`while [ -f "${m}" ]; do ${g}; done`)}u.push(`rm "${c}"; else echo "Timer deleted"; fi`),(0,y.exec)(u.join(" ; "),(m,h)=>{if(m){console.log(`error: ${m.message}`);return}if(h){console.log(`stderr: ${h}`);return}}),p({msg:`Timer "${t}" started for ${S(e)}!`,launchedFromMenuBar:r,isErr:!1})}var F=async()=>{w()&&(await(0,P.closeMainWindow)(),await M({timeInSeconds:60*30,timerName:"30 Minute Timer"}))};
