FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV ANDROID_SDK_ROOT=/opt/android-sdk
ENV FLUTTER_HOME=/opt/flutter
ENV PATH="$PATH:/opt/flutter/bin:/opt/android-sdk/cmdline-tools/latest/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/emulator"

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
		curl unzip xz-utils zip libglu1-mesa openjdk-17-jdk git gosu && \
	rm -rf /var/lib/apt/lists/* && \
	groupadd penguin && \
	useradd -m -g penguin -s /bin/bash penguin

# Install Flutter
RUN git clone https://github.com/flutter/flutter.git -b stable --depth 1 "$FLUTTER_HOME" && \
	chown -R penguin:penguin /opt/flutter

# Set git safe.directory for both users
RUN git config --global --add safe.directory /opt/flutter && \
	su - penguin -c "git config --global --add safe.directory /opt/flutter"

# Switch to penguin user for Flutter commands
USER penguin
RUN "$FLUTTER_HOME/bin/flutter" --version

# Switch back to root for following steps
USER root

# Install Android SDK Command-line Tools
RUN mkdir -p "$ANDROID_SDK_ROOT/cmdline-tools" && \
	curl -o /tmp/commandlinetools.zip https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip && \
	unzip /tmp/commandlinetools.zip -d "$ANDROID_SDK_ROOT/cmdline-tools" && \
	mv "$ANDROID_SDK_ROOT/cmdline-tools/cmdline-tools" "$ANDROID_SDK_ROOT/cmdline-tools/latest" && \
	rm /tmp/commandlinetools.zip

# Accept licenses and install build tools, platform tools, and platforms
RUN yes | "$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" --sdk_root="$ANDROID_SDK_ROOT" --licenses && \
	"$ANDROID_SDK_ROOT/cmdline-tools/latest/bin/sdkmanager" --sdk_root="$ANDROID_SDK_ROOT" \
		"platform-tools" "platforms;android-34" "build-tools;34.0.0" "emulator"

COPY ../entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/entrypoint.sh", "flutter"]
