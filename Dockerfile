FROM centos/systemd:latest

RUN yum update -y && yum -y install openssh openssh-server openssh-clients sudo initscripts

RUN ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
RUN adduser nemo
RUN mkdir /home/nemo/.ssh
RUN chmod 700 /home/nemo/.ssh
RUN chown nemo /home/nemo/.ssh/
RUN chgrp nemo /home/nemo/.ssh
RUN touch /home/nemo/.ssh/authorized_keys
RUN chmod 600 /home/nemo/.ssh/authorized_keys
RUN chown nemo /home/nemo/.ssh/authorized_keys
RUN chgrp nemo /home/nemo/.ssh/authorized_keys

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]