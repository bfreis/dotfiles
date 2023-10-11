export JAVA_HOME=$(/usr/libexec/java_home)

path=(
  "${JAVA_HOME}"/bin
  $path
)
