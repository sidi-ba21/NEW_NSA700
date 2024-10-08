FROM debian:11

RUN apt-get update && apt-get install -y openssh-server sudo python3

RUN mkdir /var/run/sshd

ENV LOGIN=root
ENV PASSWORD=root

RUN echo "$LOGIN:$PASSWORD" | chpasswd && \
	echo "$LOGIN ALL=(ALL:ALL) NOPASSWD: ALL" > /etc/sudoers.d/$LOGIN && \
	chmod 0440 /etc/sudoers.d/$LOGIN

RUN sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed "s@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g" -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

CMD ["/usr/sbin/sshd", "-D"]
