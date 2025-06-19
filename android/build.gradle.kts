plugins {
    // Apply any necessary plugins here
}

repositories {
    google()
    mavenCentral()
}

// Set custom build directory for root project
buildDir = file("../../build")

subprojects {
    repositories {
        google()
        mavenCentral()
    }
    evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}