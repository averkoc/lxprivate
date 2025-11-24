#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <pwd.h>
#include <grp.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    struct stat fileStat;
    struct passwd *pwd;
    struct group *grp;
    gid_t *groups;
    int ngroups = 0;
    int i;
    int permissionGranted;

    if(argc != 3) {
        printf("Usage: %s <username> <filename>\n", argv[0]);
        return 1;
    }

    if (strcmp(argv[1], "root") == 0) {
        printf("Read permission: yes\n");
        printf("Write permission: yes\n");
        printf("Execute permission: yes\n");
        return 0;
    }

    pwd = getpwnam(argv[1]);
    if(pwd == NULL) {
        printf("User account doesn't exist\n");
        return 1;
    }

    if(stat(argv[2],&fileStat) < 0) {
        perror("stat");
        return 1;
    }

    if (getgrouplist(argv[1], pwd->pw_gid, NULL, &ngroups) == -1) {
        groups = malloc(ngroups * sizeof(gid_t));
        if (groups == NULL) {
            perror("malloc");
            return 1;
        }
        if (getgrouplist(argv[1], pwd->pw_gid, groups, &ngroups) == -1) {
            perror("getgrouplist");
            return 1;
        }
    }

    printf("Read permission: ");
    permissionGranted = 0;
    if(fileStat.st_uid == pwd->pw_uid && (fileStat.st_mode & S_IRUSR)) {
        printf("yes (%s is the owner and has read permission)\n", argv[1]);
        permissionGranted = 1;
    } else {
        for (i = 0; i < ngroups; i++) {
            if(fileStat.st_gid == groups[i] && (fileStat.st_mode & S_IRGRP)) {
                grp = getgrgid(groups[i]);
                printf("yes (%s is in the %s group and group has read permission)\n", argv[1], grp->gr_name);
                permissionGranted = 1;
                break;
            }
        }
    }
    if (!permissionGranted) {
        printf("%s\n", (fileStat.st_mode & S_IROTH) ? "yes (all other users have read permission)" : "no");
    }

    printf("Write permission: ");
    permissionGranted = 0;
    if(fileStat.st_uid == pwd->pw_uid && (fileStat.st_mode & S_IWUSR)) {
        printf("yes (%s is the owner and has write permission)\n", argv[1]);
        permissionGranted = 1;
    } else {
        for (i = 0; i < ngroups; i++) {
            if(fileStat.st_gid == groups[i] && (fileStat.st_mode & S_IWGRP)) {
                grp = getgrgid(groups[i]);
                printf("yes (%s is in the %s group and group has write permission)\n", argv[1], grp->gr_name);
                permissionGranted = 1;
                break;
            }
        }
    }
    if (!permissionGranted) {
        printf("%s\n", (fileStat.st_mode & S_IWOTH) ? "yes (all other users have write permission)" : "no");
    }

    printf("Execute permission: ");
    permissionGranted = 0;
    if(fileStat.st_uid == pwd->pw_uid && (fileStat.st_mode & S_IXUSR)) {
        printf("yes (%s is the owner and has execute permission)\n", argv[1]);
        permissionGranted = 1;
    } else {
        for (i = 0; i < ngroups; i++) {
            if(fileStat.st_gid == groups[i] && (fileStat.st_mode & S_IXGRP)) {
                grp = getgrgid(groups[i]);
                printf("yes (%s is in the %s group and group has execute permission)\n", argv[1], grp->gr_name);
                permissionGranted = 1;
                break;
            }
        }
    }
    if (!permissionGranted) {
        printf("%s\n", (fileStat.st_mode & S_IXOTH) ? "yes (all other users have execute permission)" : "no");
    }

    free(groups);
    return 0;
}
