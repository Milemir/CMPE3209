/* Mirac Alademiroğlu, 5001240027, G1*/
#define N 26
#define R 80 
#define B 50
const int SID = 1240027;
unsigned int alarm_count = 0; 
int first_alarm_idx = -1;  //(alarm yoksa −1)
int arr[N];

int mov_avg(int p3, int p2, int p1, int cur, int idx) {
    if (idx == 0) return cur;
    if (idx == 1) return (p1 + cur) / 2;
    if (idx == 2) return (p2 + p1 + cur) / 3;
    
    int sum = p3 + p2 + p1 + cur;
    int avg = sum >> 2;
    if ((sum & 3) >= 2) {
        avg++;
    }
    return avg;
}

void check_alarm(int i, int s, int T){
    if (s > T) {
        alarm_count++;
        if (first_alarm_idx == -1) {
            first_alarm_idx = i;
        }
    }
}

int main(){
    unsigned int x = SID;
    int i;

    for(i = 0; i < N; i++){
        x = (1664525 * x + 1013904223);
        arr[i] = ((x >> 16) % R ) + B;
    }
    
    int p1 = 0, p2 = 0, p3 = 0;
    for (i = 0; i < N; i++) {
        int cur = arr[i];
        arr[i] = mov_avg(p3, p2, p1, cur, i);
        p3 = p2;
        p2 = p1;
        p1 = cur;
    }

    int T = 90 + (SID % 20);
    for (i = 0; i < N; i++) {
        check_alarm(i, arr[i], T);
    }

    return 0;
}