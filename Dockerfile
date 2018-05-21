Centos7

sudo yum install http://mirror.ghettoforge.org/distributions/gf/gf-release-latest.gf.el7.noarch.rpm
sudo yum --enablerepo=gf-plus install dante-server
sudo systemctl enable sockd.service
sudo mkdir /var/run/sockd
sudo mv /etc/sockd.conf /etc/sockd.conf.orig
sudo ifconfig
sudo vim /etc/sockd.conf

#logoutput: /var/log/socks.log
logoutput: stderr

# На каком сетевом интерфейсе и порту обслуживаем socks клиентов
internal: eth0 port = 433
# С какого IP или интерфейса выходим во внешний мир
external: eth0
#internal: x.x.x.x port = 1080
#external: x.x.x.x

# Используемый метод авторизации клиентов. none - без авторизации.
#user.libwrap: nobody
socksmethod: username
#clientmethod: username
#socksmethod: username none
user.privileged: root
user.unprivileged: nobody
#user.libwrap: nobody
client pass {
        from: 0/0 to: 0/0
        log: error
}
socks pass {
        from: 0/0 to: 149.154.167.99/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.175.10/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.175.117/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.167.42/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.175.50/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.167.50/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.167.51/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.175.100/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.167.91/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.165.120/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.166.120/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.164.250/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.167.117/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.167.118/32
        log: error
}
socks pass {
        from: 0/0 to: 149.154.167.192/27
        log: error
}
socks pass {
        from: 0/0 to: 149.154.164.8/29
        log: error
}
socks pass {
        from: 0/0 to: 91.108.8.0/27
        log: error
}
socks pass {
        from: 0/0 to: 91.108.12.0/27
        log: error
}
socks pass {
        from: 0/0 to: 91.108.16.0/27
        log: error
}
socks pass {
        from: 0/0 to: 91.108.56.0/24
        log: error
}
socks pass {
        from: 0/0 to: 91.108.4.0/24
        log: error
}
socks pass {
        from: 0/0 to: 149.154.160.0/22
        log: error
}
socks pass {
        from: 0/0 to: 149.154.164.0/22
        log: error
}
socks pass {
        from: 0/0 to: 149.154.168.0/22
        log: error
}
socks pass {
        from: 0/0 to: 149.154.172.0/22
        log: error
}
socks pass {
        from: 0/0 to: 91.108.56.0/22
        log: error
}
socks pass {
        from: 0/0 to: 91.108.4.0/22
        log: error
}
socks pass {
        from: 0/0 to: 91.108.8.0/22
        log: error
}

socks pass {
        from: 0/0 to: 91.108.16.0/22
        log: error
}

socks pass {
        from: 0/0 to: 91.108.12.0/22
        log: error
}

socks pass {
        from: 0/0 to: 149.154.160.0/20
        log: error
}

socks pass {
        from: 0/0 to: 2001:b28:f23d:f001::e/128
        log: error
}
socks pass {
        from: 0/0 to: 2001:67c:4e8:f002::e/128
        log: error
}
socks pass {
        from: 0/0 to: 2001:b28:f23d:f001::a/128
        log: error
}
socks pass {
        from: 0/0 to: 2001:67c:4e8:f002::a/128
        log: error
}
socks pass {
        from: 0/0 to: 2001:b28:f23d:f003::a/128
        log: error
}
socks pass {
        from: 0/0 to: 2001:67c:4e8:f004::a/128
        log: error
}
socks pass {
        from: 0/0 to: 2001:b28:f23f:f005::a/128
        log: error
}
socks pass {
        from: 0/0 to: 2001:67c:4e8:fa60::/64
        log: error
}
socks pass {
        from: 0/0 to: 2001:b28:f23d::/48
        log: error
}
socks pass {
        from: 0/0 to: 2001:b28:f23f::/48
        log: error
}
socks pass {
        from: 0/0 to: 2001:67c:4e8::/48
        log: error
}
socks pass {
        from: 0/0 to: 0/0
        command: bind connect udpassociate bindreply udpreply
        log: error connect
}

sudo firewall-cmd --zone=public --add-port=433/tcp --permanent

sudo firewall-cmd --zone=public --permanent --add-port=1024-65535/udp

sudo iptables -A INPUT -p udp -m multiport --dports 1024:65535 -j ACCEPT

sudo firewall-cmd --reload

sudo systemctl start sockd

nload -m –u h –U H

sudo useradd proxyuser

sudo passwd proxyuser