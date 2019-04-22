
$w_m$ vins中中值法，[$w_t , w_{t+1}]$区间的测量值
$a_m$ vins中中值法，[$a_t , a_{t+1}]$区间的测量值
$a_t$ $t$时刻的加速度测量值
$v_t$ $t$时刻的角速度测量值
$b_{at}$ 加速度在$t$时刻的偏置
$b_{wt}$ 角速度在$t$时刻的偏置
$n_{at}$ 加速度在$t$时刻的高斯噪声
$n_{wt}$ 角速度在$t$时刻的高斯噪声
1、$\delta\theta_{t+1}$ 的推导：
$$\tag{1} w_{m} = \frac {w_t+w_{t+1}} {2}$$
由参考文献2中的5.33节The error-state kinematics可知：
$$\tag{2}\delta\theta_t^{'}=-[w_m - b_w]_{\times}\delta\theta_t - \delta b_w - n_w$$ 
公式$(1)$带入公式$(2)$可得：
$$\tag{3}\delta\theta_t^{'}=-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta\theta_t - \delta{b_w} - \frac {n_{w0} + n_{w1}} {2}$$ 
由泰勒公式得：
$$\tag{4} \delta\theta_{t+1} = \delta\theta_t + \delta\theta_t^{'}\delta{t}$$
$$\begin{aligned}\tag{5} \delta\theta_{t+1} = \delta\theta_t + (-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta\theta_t - \delta{b_w} - \frac {n_{w0} + n_{w1}} {2})\delta{t}\\
=(I-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta{t})\delta\theta_t - \delta{b_w}\delta{t} - {\frac {n_{w0} + n_{w1}} {2}\delta}{t}\end{aligned}$$

2、$\delta{v}_{t+1}$ 的推导（此处不明白t和t+1的偏置为何是t时刻的）：
$$\tag{6} a_{m} = {\frac {q_t(a_t + n_{a0}-b_{at}) + q_{t+1}{(a_{t+1}+n_{a1}-b_{at})}} {2}}$$
由参考文献2中的5.33节The error-state kinematics可知：
$$\tag{7}\delta{v}^{'}=-R[a_m - b_a]_{\times}\delta\theta - R\delta b_a - Rn_a + \delta g$$ 
公式$(6)$带入公式$(7)$可得（此处应该是减去高斯噪声，但是对高斯噪声的加减是不是无所谓？ $n\backsim N\{0,\delta\}$）：
$$\tag{7}\delta v_t^{'}=-\frac {q_t[a_t - b_{at}]_{\times}\delta\theta_t + q_{t+1}[a_{t+1} - b_{at}]_{\times}\delta\theta_{t+1} + q_t\delta b_{at} + q_{t+1} \delta b_{a(t+1)} + q_t n_{a0} + q_{t+1}n_{a1}} {2} + \delta g \\
=\frac {q_t[a_t - b_{at}]_{\times}\delta\theta_t + q_{t+1}[a_{t+1} - b_{at}]_{\times}((I-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta{t})\delta\theta_t - \delta{b_w}\delta{t} - {\frac {n_{w0} + n_{w1}} {2}\delta}{t})} {2} + \\
\frac {q_t\delta b_{at} + q_{t+1} \delta b_{a(t+1)} + q_t n_{a0} + q_{t+1}n_{a1}} {2} + \delta g $$ 
由泰勒公式得：
$$\tag{8} \delta v_{t+1} = \delta v_t + \delta v_t^{'}\delta{t}$$
公式$(7)$带入公式$(8)$可得：
$$\begin{aligned} \tag{9} \delta v_{t+1} = &\delta v_t + \frac {q_t[a_t - b_{at}]_{\times}\delta\theta_t + q_{t+1}[a_{t+1} - b_{at}]_{\times}((I-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta{t})\delta\theta_t - \delta{b_w}\delta{t} - {\frac {n_{w0} + n_{w1}} {2}\delta}{t})} {2} \delta{t} \\
&+(\frac {q_t\delta b_{at} + q_{t+1} \delta b_{a(t+1)} + q_t n_{a0} + q_{t+1}n_{a1}} {2} + \delta g ) \delta{t}\\
=& \delta v_t + \frac {q_t[a_t - b_{at}]_{\times}\delta\theta_t \delta{t}} {2} \\
&+q_{t+1}[a_{t+1} - b_{at}]_{\times}\frac {((I\delta{t}-[\frac {w_t+w_{t+1}} {2}-b_{wt}]_{\times}\delta^2{t})\delta\theta_t - \delta{b_w}\delta^2{t} - {\frac {n_{w0} + n_{w1}} {2}}\delta^2{t})} {2}  \\
&+\frac {q_t\delta b_{at} + q_{t+1} \delta b_{a(t+1)} + q_t n_{a0} + q_{t+1}n_{a1}} {2} \delta t + \delta g\delta{t}\\
\end{aligned}$$
|namnnnnne|agxxxxxxxxe|
|:--|:--:|
|mark |23|
[2] Solà J. Quaternion kinematics for the error-state KF[M]// Surface and Interface Analysis. 2015.